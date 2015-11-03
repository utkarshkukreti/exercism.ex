defmodule Roman do
  @table [{"M", 1000},
          {"CM", 900},
          {"D", 500},
          {"CD", 400},
          {"C", 100},
          {"XC", 90},
          {"L", 50},
          {"XL", 40},
          {"X", 10},
          {"IX", 9},
          {"V", 5},
          {"IV", 4},
          {"I", 1}]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(0), do: ""
  for {string, number} <- @table do
    def numerals(n) when n >= unquote(number) do
      unquote(string) <> numerals(n - unquote(number))
    end
  end
end
