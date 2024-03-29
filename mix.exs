defmodule BumperCrop.MixProject do
  use Mix.Project

  def project do
    [
      app: :bumper_crop,
      deps: deps(),
      description: description(),
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      start_permanent: Mix.env() == :prod,
      version: "0.2.0"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:decimal, "~> 2.0"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:jason, "~> 1.3"},
      {:plug_cowboy, ">= 1.0.0", optional: true},
      {:tesla, "~> 1.0"},
      {:timex, "~> 3.7"},
      {:typed_struct, "~> 0.3.0"}
    ]
  end

  defp description do
    ~s"""
    Bumper Crop is an Elixir client package for communicating with Harvest's v2 API (getharvest.com)
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/tmecklem/bumper_crop"}
    ]
  end
end
