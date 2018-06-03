defmodule Fibonacci do
  def fib_at_naive(number) do
    naive_fib(number)
  end

  def fib_at_tail(number) do
    tail_fib(number, 0, 1)
  end

  def time(func, arg) do
    t0 = Time.utc_now()
    func.(arg)
    Time.diff(Time.utc_now(), t0, :millisecond)
  end

  def compare(n \\ 40) do
    IO.puts(~s{Naive: #{time(&fib_at_naive/1, n)}})
    IO.puts(~s{Tail Recursive: #{time(&fib_at_tail/1, n)}})
  end

  defp tail_fib(1, _acc1, acc2), do: acc2

  defp tail_fib(number, acc1, acc2) do
    tail_fib(number - 1, acc2, acc1 + acc2)
  end

  defp naive_fib(number) when number <= 2, do: 1

  defp naive_fib(number) do
    naive_fib(number - 1) + naive_fib(number - 2)
  end
end
