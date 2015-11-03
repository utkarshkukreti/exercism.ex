defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> String.to_char_list
    |> Enum.reduce(0, fn
      ?0, acc -> acc * 2
      ?1, acc -> acc * 2 + 1
      _,  _   -> 0
    end)
  end
end
