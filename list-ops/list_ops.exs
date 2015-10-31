defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)

  defp count([], n), do: n
  defp count([_ | t], n), do: count(t, n + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])

  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map(l, f, [])

  defp map([], _f, acc), do: reverse(acc)
  defp map([h | t], f, acc), do: map(t, f, [f.(h) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter(l, f, [])

  defp filter([], _f, acc), do: reverse(acc)
  defp filter([h | t], f, acc) do
    if f.(h) do
      filter(t, f, [h | acc])
    else
      filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, b), do: do_append(reverse(a), b)

  defp do_append([], b), do: b
  defp do_append([h | t], b), do: do_append(t, [h | b])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: reduce(reverse(ll), [], &append/2)
end
