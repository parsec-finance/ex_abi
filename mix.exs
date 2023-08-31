defmodule ABI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_abi,
      version: "0.6.0",
      elixir: "~> 1.8",
      description: "Ethereum's ABI Interface",
      package: [
        maintainers: ["Ayrat Badykov, Victor Baranov"],
        licenses: ["GPL-3.0"],
        links: %{"GitHub" => "https://github.com/poanetwork/ex_abi"}
      ],
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
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
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:jason, "~> 1.4"},
      {:parsec_keccak,
        git: "https://github.com/parsec-finance/parsec_keccak",
        ref: "91232f4bd4444a5b5c2dd3724ab169d1699a3253"
      },
      {:propcheck, "~> 1.4", only: [:test, :dev]}
    ]
  end

  defp dialyzer do
    [
      flags: [:error_handling, :underspecs, :unknown, :unmatched_returns]
    ]
  end
end
