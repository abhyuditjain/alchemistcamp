defmodule Fib.TimerTest do
  use ExUnit.Case
  doctest Fib
  alias Fib
  alias Fib.Timer

  test "timer returns a number" do
    assert is_number Timer.time(&Fib.naive/1, [10])
  end

  test "timer works on arity >= 2 function" do
    assert is_number Timer.time(&Fib.naive/2, [5, 10])
  end

  test "faster function is faster than naive function" do
    naive_time = Timer.time(&Fib.naive/1, [35])
    faster_time = Timer.time(&Fib.faster/1, [35])
    assert faster_time < naive_time
  end
end
