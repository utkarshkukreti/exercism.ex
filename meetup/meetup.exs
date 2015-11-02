defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) when schedule in [:first, :second, :third, :fourth] do
    index = case schedule do
              :first -> 0
              :second -> 1
              :third -> 2
              :fourth -> 3
            end
    day = 1 .. :calendar.last_day_of_the_month(year, month)
    |> Enum.filter(fn day ->
      day_of_the_week(year, month, day) == weekday
    end)
    |> Enum.at(index)
    {year, month, day}
  end
  def meetup(year, month, weekday, :last) do
    day = :calendar.last_day_of_the_month(year, month) .. 1
    |> Enum.find(fn day ->
      day_of_the_week(year, month, day) == weekday
    end)
    {year, month, day}
  end
  def meetup(year, month, weekday, :teenth) do
    day = 13 .. 19
    |> Enum.find(fn day ->
      day_of_the_week(year, month, day) == weekday
    end)
    {year, month, day}
  end

  defp day_of_the_week(year, month, day) do
    case :calendar.day_of_the_week(year, month, day) do
      1 -> :monday
      2 -> :tuesday
      3 -> :wednesday
      4 -> :thursday
      5 -> :friday
      6 -> :saturday
      7 -> :sunday
    end
  end
end
