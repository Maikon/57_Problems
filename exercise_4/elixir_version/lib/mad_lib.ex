defmodule MadLib do

  def main(_args) do
    print_statement(get("noun"), get("verb"), get("adjective"), get("adverb"))
  end

  def get(semantic) do
    IO.gets("Enter a #{semantic}: ")
    |> String.strip
  end

  def print_statement(noun, verb, adjective, adverb) do
    IO.puts("#{String.capitalize(noun)}! You’re #{adverb} running out of time so #{verb} now #{adjective} rebel!")
  end
end
