defmodule QuotePrinter do

  def main(_args) do
    print_quote(get_author, get_quote)
  end

  def get_quote,    do: IO.gets("A quote that you like: ") |> strip
  def get_author,   do: IO.gets("The author: ") |> strip
  def strip(input), do: String.strip(input)

  def print_quote(author, the_quote) do
    IO.write(author <> " says, " <> <<39>> <> the_quote <> <<39>>)
  end
end
