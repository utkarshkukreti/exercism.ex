defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext) do
    plaintext
    |> String.downcase
    |> String.to_char_list
    |> Enum.map(&encode_char/1)
    |> Enum.reject(&is_nil/1)
    |> Enum.chunk(5, 5, [])
    |> Enum.map(&List.to_string/1)
    |> Enum.join(" ")
  end

  @alphabet 'abcdefghijklmnopqrstuvwxyz'
  for {a, b} <- Enum.zip(@alphabet, Enum.reverse(@alphabet)) do
    defp encode_char(unquote(a)), do: unquote(b)
  end
  for a <- '0123456789' do
    defp encode_char(unquote(a)), do: unquote(a)
  end
  defp encode_char(_), do: nil
end
