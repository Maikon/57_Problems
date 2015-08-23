defmodule MadLibTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "prompts user for a semantic" do
    message = capture_io("dog", fn ->
      MadLib.get("noun")
    end)
    assert message == "Enter a noun: "
  end

  test "returns input from user" do
    message = capture_io([input: "dog", capture_prompt: false], fn ->
      IO.write MadLib.get("noun")
    end)
    assert message == "dog"
  end

  test "builds the output statement" do
    output = capture_io(fn ->
     MadLib.print_statement("dog", "walk", "blue", "quickly")
    end)

    assert output == "Dog! You’re quickly running out of time so walk now blue rebel!\n"
  end
end
