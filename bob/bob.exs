defmodule Teenager do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") ->
        "Sure."
      input == String.upcase(input) && input != String.downcase(input) ->
        "Whoa, chill out!"
      String.strip(input) == "" ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end
end
