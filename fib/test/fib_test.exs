defmodule FibTest do
  use ExUnit.Case
  doctest Fib

  test "naive base cases" do
    assert Fib.naive(1) === 1
    assert Fib.naive(2) === 1
  end

  test "naive other cases" do
    assert Fib.naive(6) === 8
    assert Fib.naive(9) === 34
    assert Fib.naive(17) === 1597
  end

  # Cannot do this
  # test "naive large cases" do
  #   assert Fib.naive(150) === 9_969_216_677_189_303_386_214_405_760_200
  # end

  test "tail recursive base cases" do
    assert Fib.faster(1) === 1
    assert Fib.faster(2) === 1
  end

  test "tail recursive other cases" do
    assert Fib.faster(6) === 8
    assert Fib.faster(9) === 34
    assert Fib.faster(17) === 1597
  end

  test "tail recursive large cases" do
    assert Fib.faster(150) === 9_969_216_677_189_303_386_214_405_760_200
  end
end
