defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    pow(2, number - 1)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    pow(2, 64) - 1
  end

  # Fast integer power.
  defp pow(_, 0), do: 1
  defp pow(a, b) when rem(b, 2) == 0 do
    c = pow(a, div(b, 2))
    c * c
  end
  defp pow(a, b) do
    a * pow(a, b - 1)
  end
end
