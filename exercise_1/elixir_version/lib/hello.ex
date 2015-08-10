defmodule Hello do

	def main(_args) do
		prompt
		|> greeting
		|> print
	end

	def prompt,            do: String.strip(IO.gets "Your name?\n|> ")
	def greeting("Bill"),  do: "Do it live!"
	def greeting(name),    do: "Hello " <> name <> "!"
	def print(message),    do: IO.puts message
end
