defmodule Ch8 do
  def deck do
    for r <- ranks, s <- suits, do: r <> " of " <> s
  end

  defp ranks do
    Enum.map(1..10, &Integer.to_string/1) ++ ~w(Jack Queen King Ace)
  end

  defp suits do
    ~w(Spades Hearts Clubs Diamonds)
  end
end
