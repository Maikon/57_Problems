defmodule Hello.Mixfile do
	use Mix.Project

	def project do
		[
			app: :hello,
			version: "0.0.1",
			elixir: "~> 1.0",
			escript: [main_module: Hello]
		]
	end

end
