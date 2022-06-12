defmodule Factual.MixProject do
  use Mix.Project

  def project do
    [
      app: :factual,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  defp aliases() do
    [
      "ecto.reset": [
        "ecto.drop",
        "ecto.create",
        "ecto.migrate"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Factual.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:ecto_sqlite3, "~> 0.7.5"},
      {:jason, "~> 1.3"},
      {:absinthe, "~> 1.6.0"},
      {:plug_cowboy, "~> 2.0"},
      {:absinthe_plug, "~> 1.5"}
    ]
  end
end
