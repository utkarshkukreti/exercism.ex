defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base = String.downcase(base)
    Enum.filter(candidates, &anagram?(base, String.downcase(&1)))
  end

  defp anagram?(a, a), do: false
  defp anagram?(a, b) do
    Enum.sort(String.codepoints(a)) == Enum.sort(String.codepoints(b))
  end
end
