defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    if raw =~ ~r/^(\d|\W)+$/ do
      digits =
        Regex.scan(~r/\d/, raw)
        |> Enum.map(&hd/1)
        |> Enum.join
      cond do
        byte_size(digits) == 10 -> digits
        byte_size(digits) == 11 ->
          case digits do
            "1" <> rest -> rest
            otherwise -> "0000000000"
          end
        true -> "0000000000"
      end
    else
      "0000000000"
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    <<a :: binary-size(3), _ :: binary>> = number(raw)
    a
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    <<a :: binary-size(3), b :: binary-size(3), c :: binary-size(4)>> = number(raw)
    "(#{a}) #{b}-#{c}"
  end
end
