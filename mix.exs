defmodule ApqExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :apq_example,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ApqExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:apq, "~> 1.0"},
      {:corsica, "~> 1.0"},
      {:absinthe_plug,
       git: "https://github.com/absinthe-graphql/absinthe_plug.git",
       branch: "master",
       override: true},
      {:cowboy, "~> 2.0"},
      {:plug, "~> 1.0"},
      {:cachex, "~> 3.0"},
      {:jason, "~> 1.1"},
      {:telemetry, "~> 0.4.0"}
    ]
  end
end
