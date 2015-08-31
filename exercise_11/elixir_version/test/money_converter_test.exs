defmodule MoneyConverterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "converts pounds to euro" do
    dollar = 1
    euro_rate = 0.73
    result = MoneyConverter.convert(dollar, euro_rate)
    assert result == 1.37
  end

  test "holds various currencies" do
    assert MoneyConverter.conversion_rate("EUR", "GBP") == {"pound->euro", 0.72}
    assert MoneyConverter.conversion_rate("GBP", "USD") == {"dollar->pound", 1.54}
  end

  test "asks user for the amount to convert" do
    message = capture_output(&MoneyConverter.get_amount/0)
    assert message == "Please enter the amount you would like to convert: "
  end

  test "returns the input from the user" do
    input = capture_input("1", &MoneyConverter.get_amount/0)
    assert input == "1"
  end

  test "converts input from user into numerical format" do
    assert MoneyConverter.to_numerical("1") == 1
  end

  test "prints the conversion statement" do
    message = capture_io(fn ->
      MoneyConverter.print_statement("pound->euro", 1, 0.73, 1.37)
    end)
    assert message == "1 Pound(s) at an exchange rate of 0.73 is 1.37 Euro(s)"
  end

  test "selecting a country to convert from" do
    message = capture_output(&MoneyConverter.from/0)
    assert message == "Please choose country of currency to convert from (i.e 'USD'): "
  end

  test "country to convert from" do
    input = capture_input("usd", &MoneyConverter.from/0)
    assert input == "USD"
  end

  test "selecting a country to convert to" do
    message = capture_output(&MoneyConverter.to/0)
    assert message == "Please choose country of currency to convert to (i.e 'USD'): "
  end

  test "country to convert to" do
    input = capture_input("usd", &MoneyConverter.to/0)
    assert input == "USD"
  end

  def capture_input(input, func) do
    capture_io([input: input, capture_prompt: false], fn ->
      IO.write func.()
    end)
  end

  def capture_output(func) do
    capture_io([input: "nothing"], fn ->
      func.()
    end)
  end
end
