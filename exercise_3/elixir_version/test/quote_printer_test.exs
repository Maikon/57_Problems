defmodule QuotePrinterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "asks the user for a quote" do
    message = capture_io("something", fn ->
      QuotePrinter.get_quote
    end)
    assert String.contains?(message, "A quote that you like: ")
  end

  test "returns the quote" do
    message = capture_io([input: "the quote", capture_prompt: false], fn ->
      IO.write QuotePrinter.get_quote
    end)
    assert message == "the quote"
  end

  test "asks for an author" do
    message = capture_io("something", fn ->
      QuotePrinter.get_author
    end)
    assert String.contains?(message, "The author: ")
  end

  test "returns the author" do
    message = capture_io([input: "Bruce Lee", capture_prompt: false], fn ->
      IO.write QuotePrinter.get_author
    end)
    assert message == "Bruce Lee"
  end

  test "prints the quote with the author" do
    message = capture_io(fn ->
      QuotePrinter.print_quote("Author", "The Quote")
    end)
    assert message == "Author says, 'The Quote'"
  end
end
