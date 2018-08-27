defmodule Fib do
  def naive(1), do: 1
  def naive(2), do: 1

  def naive(number) do
    naive(number - 1) + naive(number - 2)
  end

  def faster(number) do
    faster(number, 0, 1)
  end

  def compare(n \\ 40) do
    IO.puts(~s{Naive: #{Fib.Timer.time(&naive/1, n)}})
    IO.puts(~s{Tail Recursive: #{Fib.Timer.time(&faster/1, n)}})
  end

  defp faster(1, _acc1, acc2), do: acc2

  defp faster(number, acc1, acc2) do
    faster(number - 1, acc2, acc1 + acc2)
  end
end
