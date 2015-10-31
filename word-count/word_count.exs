defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    Regex.scan(~r/(\p{L}|\p{N}|-)+/u, sentence)
    |> Enum.map(&hd/1)
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
