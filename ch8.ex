defmodule Ch8 do
  def deck do
    for r <- ranks(), s <- suits(), do: r <> " of " <> s
  end

  defp ranks do
    Enum.map(1..10, &Integer.to_string/1) ++ ~w(Jack Queen King Ace)
  end

  defp suits do
    ~w(Spades Hearts Clubs Diamonds)
  end

  # find right angle triangle with integer side length less than n
  def triangles(n) when n < 1, do: []

  def triangles(n) do
    for a <- 1..n,
        b <- 1..n,
        c <- 1..n,
        c >= b,
        b >= a,
        a + b > c,
        c * c == a * a + b * b,
        do: {a, b, c}
  end
end
