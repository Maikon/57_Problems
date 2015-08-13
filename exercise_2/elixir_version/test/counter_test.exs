defmodule CounterTest do
	use ExUnit.Case
	import ExUnit.CaptureIO

	test "prompts user for input" do
		message = capture_io([input: "123"], fn ->
			Counter.get_input
		end)

		assert String.contains?(message, "Please enter a word")
	end

	test "returns user input" do
		input = capture_io([input: "Joe"], fn ->
			IO.write Counter.get_input
		end)

		assert String.contains?(input, "Joe")
	end

	test "counts the characters in a word" do
		assert Counter.chars("Joe") == 3
	end

	test "builds statement" do
		assert Counter.statement(3, "Joe") == "Joe has 3 characters"
	end

	test "prints the result" do
		message = capture_io([], fn ->
			Counter.print_result("Joe has 3 characters")
		end)
		assert String.contains?(message, "3")
	end
end
