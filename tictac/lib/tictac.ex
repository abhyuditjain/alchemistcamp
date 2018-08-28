defmodule Tictac do
  @players {:x, :o}

  def new_board do
    for s <- squares(), into: %{}, do: {s, :empty}
  end

  def check_player(player) do
    case player do
      :x -> {:ok, player}
      :o -> {:ok, player}
      _ -> {:error, :invalid_player}
    end
  end

  def make_move(board, place, player) do
    case board[place] do
      nil -> {:error, :invalid_place}
      :empty -> {:ok, %{board | place => player}}
      _ -> {:error, :occupied}
    end
  end

  def play_at(board, col, row, player) do
    with {:ok, valid_player} <- check_player(player),
         {:ok, square} <- Square.new(col, row),
         {:ok, new_board} <- make_move(board, square, valid_player),
         do: new_board
  end

  def squares do
    for c <- 1..3, r <- 1..3, into: MapSet.new(), do: %Square{col: c, row: r}
  end
end
