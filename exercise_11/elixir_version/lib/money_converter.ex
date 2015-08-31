defmodule MoneyConverter do

  def main(_) do
    amount = get_amount |> to_numerical
    {currency, rate} = conversion_rate(from, to)
    result = convert(amount, rate)
    print_statement(currency, amount, rate, result)
  end

  def get_amount do
    IO.gets("Please enter the amount you would like to convert: ")
  end

  def from do
    get_currency("from")
  end

  def to do
    get_currency("to")
  end

  def convert(amount, rate) do
    (1 / rate) * amount |> Float.round(2)
  end

  def conversion_rate(from, to) do
    get_rates[from][to]
  end

  def to_numerical(amount) do
    {amount, _} = Integer.parse(amount)
    amount
  end

  def print_statement(currency, amount, rate, result) do
    [from, to] = String.split(currency, "->")
    IO.write "#{amount} #{capitalize(from)}(s) at an exchange rate of #{rate} is #{result} #{capitalize(to)}(s)"
  end

  defp get_rates do
    %{
      "USD" => %{
        "GBP" => {"pound->dollar", get_rate("GBP")},
        "EUR" => {"euro->dollar",  get_rate("EUR")}
      },
      "GBP" => %{
        "USD" => {"dollar->pound", 1.54},
        "EUR" => {"euro->pound",   1.37}
      },
      "EUR" => %{
        "USD" => {"dollar->euro", 1.12},
        "GBP" => {"pound->euro",  0.72}
      }
    }
  end

  defp get_rate(country) do
    api_result = HTTPoison.get!("https://openexchangerates.org/api/latest.json\?app_id\=84c1a8d2b45041a984bfc00284f452a8").body
    %{"rates" => rates} = Poison.Parser.parse!(api_result)
    rates[country]
  end

  defp get_currency(source) do
    IO.gets("Please choose country of currency to convert #{source} (i.e 'USD'): ")
    |> String.strip
    |> String.upcase
  end

  defp capitalize(string) do
    String.capitalize(string)
  end
end
