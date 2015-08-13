defmodule Counter.Mixfile do
	use Mix.Project

	def project do
		[
			app: :counter,
			version: "0.0.1",
			elixir: "~> 1.0",
			escript: [main_module: Counter]
		]
	end
end
