defmodule Counter do

	def main(_args) do
		string = get_input
		string
		|> chars
		|> statement(string)
		|> print_result
	end

	def get_input,                do: String.strip(IO.gets("Please enter a word:\n|> "))
	def chars(string),            do: string |> String.length
	def print_result(message),    do: IO.puts message
	def statement(count, string), do: "#{string} has #{count} characters"
end
