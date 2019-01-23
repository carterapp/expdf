defmodule ExpdfTest do
  use ExUnit.Case
  doctest Expdf

  test 'basic test' do
    filename = "/tmp/test1.pdf"

    pdf =
      Expdf.start(font: "Courier", font_size: 30)
      |> Expdf.add_text("bottom left", left: 0, bottom: 0)
      |> Expdf.add_text("top right", right: 0, top: 0)
      |> Expdf.add_text("top left", left: 0, top: 0)
      |> Expdf.add_text("bottom right", right: 0, bottom: 0)

    Expdf.export_and_delete(pdf, filename)
  end

  test 'table test' do
    filename = "/tmp/test2.pdf"

    pdf =
      Expdf.start(font: "Courier", font_size: 30)
      |> Expdf.add_text("bottom left", left: 0, bottom: 0)
      |> Expdf.add_text("top right", right: 0, top: 0)
      |> Expdf.add_text("top left", left: 0, top: 0)
      |> Expdf.add_text("bottom right", right: 0, bottom: 0)
      |> Expdf.add_page()
      |> Expdf.add_table(
        [{"First", []}, {"Second", width: 2}, {"Last", align: :right}],
        [
          [{"hello", []}, {"pdf", []}, {"world", []}],
          [{"hello", []}, {"pdf", []}, {"world", []}],
          [{"hello", []}, {"pdf", []}, {"world", []}]
        ],
        top: 40,
        padding: 5
      )

    Expdf.export_and_delete(pdf, filename)
  end

  test 'character test' do
    filename = "/tmp/test3.pdf"

    pdf =
      Expdf.start(font: "Courier", font_size: 30, title: "æøå ` '")
      |> Expdf.add_text("æøåÆØÅ ' ` ", left: 0, top: 0)
      |> Expdf.add_text("Hello’s Shop - Butique", left: 0, top: 40)

    Expdf.export_and_delete(pdf, filename)
  end
end
