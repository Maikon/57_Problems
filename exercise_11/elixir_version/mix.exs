defmodule MoneyConverter.Mixfile do
  use Mix.Project

  def project do
    [app: :money_converter,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     escript: [main_module: MoneyConverter]]
  end

  def application do
    [applications: [:httpoison]]
  end

  def deps do
    [
      {:httpoison, "~> 0.7.2"},
      {:poison, "~> 1.5"}
    ]
  end
end
