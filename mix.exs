defmodule Expdf.MixProject do
  use Mix.Project

  def project do
    [
      app: :expdf,
      version: "0.1.3",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      erlc_paths: ["src/erlguten/src", "src/erlguten/include"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:erlguten, github: "codenaut/erlguten", tag: "8c43bc63972d1023a8693053f25403bd4dff3d24"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp description() do
    "Library for generating PDF files from Elixir"
  end

  defp package() do
    [
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/codenaut/expdf"}
    ]
  end
end
