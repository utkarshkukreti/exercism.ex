defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    {la, lb} = {length(a), length(b)}
    cond do
      la == lb && a == b -> :equal
      la < lb && sublist?(a, b) -> :sublist
      la > lb && sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a, [_ | t] = b) do
    starts_with?(b, a) || sublist?(a, t)
  end

  defp starts_with?(_, []), do: true
  defp starts_with?([h | ta], [h | tb]), do: starts_with?(ta, tb)
  defp starts_with?(_, _), do: false
end
