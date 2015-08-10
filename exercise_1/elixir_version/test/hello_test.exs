defmodule HelloTest do
	use ExUnit.Case
	import ExUnit.CaptureIO

	test "prompts user for input" do
		input = capture_io([input: "Joe"], fn ->
			IO.write Hello.prompt
		end)

		assert String.contains?(input, "Joe")
	end

	test "greeting message" do
		name = "Joe"

		assert Hello.greeting(name) == "Hello Joe!"
	end

	test "specific greeting" do
		name = "Bill"

		assert Hello.greeting(name) == "Do it live!"
	end

	test "prints a message" do
		input = capture_io([], fn ->
			Hello.print("Hello")
		end)

		assert input == "Hello\n"
	end
end
