defmodule Jingle.Mixfile do
  use Mix.Project

  def project do
    [app: :jingle,
     version: "0.0.1",
     elixir: "~> 1.4.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Jingle, []},
     applications: apps(Mix.env)]
  end
  defp apps(:dev), do: [:dotenv | apps()]
  defp apps(:test), do: [:dotenv | apps()]
  defp apps(_), do: apps()
  defp apps, do: [
    :phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext,
    :phoenix_ecto, :postgrex, :corsica, :prx_auth, :timex
  ]

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.2"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.3.0"},
     {:postgrex, ">= 0.13.5"},
     {:phoenix_html, "~> 2.11"},
     {:phoenix_live_reload, "~> 1.1.3", only: :dev},
     {:timex, "~> 3.2.1"},
     {:corsica, "~> 1.1.1"},
     {:prx_auth, "~> 0.0.1"},
     {:gettext, "~> 0.15"},
     {:cowboy, "~> 1.1.2"},
     {:dotenv, "~> 3.0.0", only: [:dev, :test]}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
