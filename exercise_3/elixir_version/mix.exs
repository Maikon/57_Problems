defmodule QuotePrinter.Mixfile do
  use Mix.Project

  def project do
    [app: :quote_printer,
     version: "0.0.1",
     elixir: "~> 1.0",
     escript: [main_module: QuotePrinter]]
  end
end
