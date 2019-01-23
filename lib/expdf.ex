defmodule Expdf do
  @moduledoc """
  A collection of functions helping you generate a PDF using erlguten
  """

  @default_font 'Helvetica'
  @default_font_size 12
  @default_pagesize :a4

  def start(opts \\ []) do
    pdf = :eg_pdf.new()
    :eg_pdf.set_pagesize(pdf, Keyword.get(opts, :pagesize, @default_pagesize))

    opts[:author] && :eg_pdf.set_author(pdf, str2ch(opts[:author]))
    opts[:title] && :eg_pdf.set_title(pdf, str2ch(opts[:title]))
    opts[:subject] && :eg_pdf.set_subject(pdf, str2ch(opts[:subject]))
    opts[:keywords] && :eg_pdf.set_keywords(pdf, str2ch(opts[:keywords]))

    :eg_pdf.set_font(
      pdf,
      str2ch(Keyword.get(opts, :font, @default_font)),
      Keyword.get(opts, :font_size, @default_font_size)
    )

    pdf
  end

  def set_page(pdf, page) do
    :eg_pdf.set_page(pdf, page)
    pdf
  end

  def add_page(pdf) do
    page = :eg_pdf.get_page_no(pdf)
    :eg_pdf.new_page(pdf)
    set_page(pdf, page + 1)
  end

  def export_and_delete(pdf, filename) do
    {serialised, _page} = :eg_pdf.export(pdf)
    :file.write_file(filename, [serialised])
    :eg_pdf.delete(pdf)
    {:ok, filename}
  end

  def get_font(pdf, opts \\ []) do
    font_size = opts[:font_size] || 12

    font =
      if opts[:font] do
        str2ch(opts[:font])
      else
        [{:pdfContext, _, _, default_font, _, _, _, _, _, _} | _] = :eg_pdf.get_state(pdf)
        (default_font && default_font.fontName) || nil
      end

    {font, font_size}
  end

  def get_string_width(pdf, text, opts \\ []) do
    {font, font_size} = get_font(pdf, opts)
    :eg_pdf.get_string_width(pdf, font, font_size, str2ch(text))
  end

  def get_dimensions(pdf, opts \\ []) do
    if opts[:dimensions] do
      opts[:dimensions]
    else
      [{:pdfContext, _, _, _, _, _, _, _, dimensions, _} | _] = :eg_pdf.get_state(pdf)
      dimensions
    end
  end

  def get_bounds(pdf, opts) do
    {left, bottom, right, top} = get_dimensions(pdf, opts)
    width = opts[:width] || 0
    height = opts[:height] || 0
    o = fn key -> opts[key] || 0 end

    {x0, x1} =
      if opts[:left] do
        {left + o.(:left), left + width + o.(:left)}
      else
        if opts[:right] do
          {right - width - o.(:right), right - o.(:right)}
        else
          {left, left + width}
        end
      end

    {y0, y1} =
      if opts[:bottom] do
        {bottom + o.(:bottom), bottom + height + o.(:bottom)}
      else
        if opts[:top] do
          {top - height - o.(:top), top - o.(:top)}
        else
          {bottom, bottom + height}
        end
      end

    {{x0, y0}, {x1, y1}}
  end

  defp str2ch(str) do
    if is_bitstring(str) do
      # Quick hack to remove non-printable characters
      to_charlist(str) |> Enum.filter(&(&1 < 256))
    else
      str
    end
  end

  def add_text(pdf, text, opts \\ []) do
    {font, font_size} = get_font(pdf, opts)

    content = str2ch(text)
    {{x0, y0}, {x1, y1}} = get_bounds(pdf, opts)

    x_pos =
      if opts[:right] do
        x1 - get_string_width(pdf, content, opts)
      else
        x0
      end

    y_pos =
      if opts[:top] do
        y1 - font_size
      else
        y0
      end

    :eg_pdf.begin_text(pdf)
    :eg_pdf.set_font(pdf, font, font_size)
    :eg_pdf.set_text_pos(pdf, x_pos, y_pos)
    :eg_pdf.textbr(pdf, content)

    :eg_pdf.end_text(pdf)
    pdf
  end

  def add_rectangle(pdf, pos, size, opts \\ []) do
    :eg_pdf.set_line_width(pdf, opts[:line_width] || 1)
    :eg_pdf.rectangle(pdf, pos, size, :stroke)
    pdf
  end

  def add_line(pdf, {x0, y0}, {x1, y1}, opts \\ []) do
    :eg_pdf.set_line_width(pdf, opts[:line_width] || 1)
    :eg_pdf.line(pdf, x0, y0, x1, y1)
    pdf
  end

  def add_hline(pdf, {x, y}, width, opts \\ []) do
    :eg_pdf.set_line_width(pdf, opts[:line_width] || 1)
    :eg_pdf.line(pdf, x, y, x + width, y)
    pdf
  end

  def add_text_lines(pdf, lines, opts \\ []) do
    line_spacing = opts[:line_spacing] || 5

    {height, width, lines} =
      Enum.reduce(lines, {0, 0, []}, fn l, {height, width, ls} ->
        {text, _line_opts} = l
        {font, font_size} = get_font(pdf, opts)
        line_width = :eg_pdf.get_string_width(pdf, font, font_size, str2ch(text))
        line_height = font_size + line_spacing
        {height + line_height, max(line_width, width), [{l, line_height} | ls]}
      end)

    {{x0, y0}, {x1, y1}} = get_bounds(pdf, Keyword.merge(opts, width: width, height: height))

    padding = 5
    box_x = x0 - padding
    box_y = y0 - padding
    box_w = width + padding * 2
    box_h = height + padding * 2

    add_rectangle(pdf, {box_x, box_y}, {box_w, box_h})

    _ =
      lines
      |> Enum.reduce({x0, y0, x1, y1}, fn {l, line_height},
                                          {left, bottom, right, top} = dimensions ->
        {text, line_opts} = l
        add_text(pdf, text, Keyword.merge(line_opts || [], dimensions: dimensions))
        {left, bottom + line_height, right, top}
      end)

    pdf
  end

  def add_table(pdf, header, items, opts \\ []) do
    font_size = opts[:font_size] || 12
    line_height = font_size + 4
    margin = opts[:margin] || 10
    padding = opts[:padding] || 0
    {x0, _y0, x1, y1} = get_dimensions(pdf, opts)
    table_width = x1 - x0 - margin * 2

    header_size =
      Enum.reduce(header, 0, fn {_text, opts}, sum ->
        w = opts[:width] || 1
        sum + w
      end)

    x = x0 + margin
    y = opts[:top] || y1
    width_increment = table_width / header_size
    table_height = (1 + Enum.count(items)) * line_height

    {{x0, y0}, {_x1, y1}} =
      get_bounds(pdf, Keyword.merge(opts, width: table_width, height: table_height))

    pdf
    |> add_rectangle({x0 + margin, y0}, {table_width, table_height})

    _ =
      header
      |> Enum.reduce(x, fn {text, opts}, offset ->
        w = opts[:width] || 1
        width = w * width_increment

        extra_offset =
          if opts[:align] == :right do
            text_width = get_string_width(pdf, text, opts)
            width - text_width - padding
          else
            padding
          end

        pdf
        |> add_text(text, left: offset + extra_offset, top: y)

        offset + width
      end)

    pdf
    # Spacer between header and boxy
    |> add_hline({x, y1 - line_height}, table_width)

    body_start = y + line_height

    _ =
      items
      |> Enum.reduce(body_start, fn columns, y_offset ->
        _ =
          columns
          |> Enum.reduce({x, 0}, fn l, {x_offset, idx} ->
            {text, opts} = l

            {_header, header_opts} = Enum.at(header, idx)
            width = header_opts[:width] || 1

            extra_offset =
              if header_opts[:align] == :right do
                text_width = get_string_width(pdf, text, opts)
                width * width_increment - text_width - padding
              else
                padding
              end

            pdf
            |> add_text(text, left: extra_offset + x_offset, top: y_offset)

            {x_offset + width * width_increment, idx + 1}
          end)

        y_offset + line_height
      end)

    pdf
  end
end
