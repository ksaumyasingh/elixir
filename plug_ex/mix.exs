defmodule PlugEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_ex,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger , :plug, :cowboy],
      mod: {PlugEx, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.13.6"},
      {:cowboy, "~> 2.9.0 "}
    ]
  end
end
