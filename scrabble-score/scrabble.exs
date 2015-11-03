defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) when is_binary(word) do
    word
    |> String.downcase
    |> String.to_char_list
    |> Enum.map(&score/1)
    |> Enum.sum
  end

  @spec score(char) :: non_neg_integer
  def score(letter) when letter in 'aeioulnrst', do: 1
  def score(letter) when letter in 'dg', do: 2
  def score(letter) when letter in 'bcmp', do: 3
  def score(letter) when letter in 'fhvwy', do: 4
  def score(letter) when letter in 'k', do: 5
  def score(letter) when letter in 'jx', do: 8
  def score(letter) when letter in 'qz', do: 10
  def score(_), do: 0
end
