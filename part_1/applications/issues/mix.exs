defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [app: :issues,
     name: "Issues",
     source_url: "https://github.com/tothpeter/elixir-practice/tree/master/projects/issues",
     version: "0.1.0",
     elixir: "~> 1.3",
     escript: escript_config,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [ :logger, :httpoison ]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      { :httpoison, "~> 0.9.0" },
      { :jsx,       "~> 2.0"   },
      { :ex_doc,    github: "elixir-lang/ex_doc" }
    ]
  end

  def escript_config do
    [ main_module: Issues.CLI ]
  end
end
