defmodule Sieve do
  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    # This is a proper Sieve implementation using a mutable map.
    table = :ets.new :primes, []

    for i <- 2..limit do
      :ets.insert table, {i, true}
    end

    for i <- 2..limit do
      case :ets.lookup(table, i) do
        [{^i, true}] ->
          for j <- Stream.iterate(i + i, &(&1 + i)) |> Stream.take_while(&(&1 <= limit)) do
            :ets.insert table, {j, false}
          end
        [{^i, false}] -> :ok
      end
    end

    Enum.filter(2..limit, fn i ->
      match?([{_, true}], :ets.lookup(table, i))
    end)
  end
end
