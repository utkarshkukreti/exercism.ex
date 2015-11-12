defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map() 
  def generate(max_factor, min_factor \\ 1) do
    for(a <- min_factor..max_factor,
        b <- a..max_factor,
        palindrome?(a * b)) do
      [a, b]
    end
    |> Enum.group_by(fn [a, b] -> a * b end)
    |> Enum.map(fn {key, value} -> {key, Enum.reverse(value)} end)
  end

  defp palindrome?(number) do
    string = Integer.to_string(number)
    string == String.reverse(string)
  end
end
