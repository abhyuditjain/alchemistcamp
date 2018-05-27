defmodule GuessingGame do
  @moduledoc """
  This is a Guessing Game. You have to choose a number in mind. The program will try to guess the number. All you have to tell it is if the number is bigger or smaller than your number. Or it is your number.
  """

  @doc """
  This function starts the game with the given range from `a` to `b`
  """
  def guess(a, b) when a > b, do: guess(b, a)

  def guess(low, high) do
    user_input = IO.gets("Hmm..... are you thinkng of the number: #{mid(low, high)} ?\n")

    case String.trim(user_input) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew I could guess the number"

      _ ->
        IO.puts(~s(Type "bigger", "smaller" or "yes"))
        guess(low, high)
    end
  end

  def mid(a, b) do
    div(a + b, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
