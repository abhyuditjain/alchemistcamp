defmodule Tictac do
  @players [:x, :o]

  alias Tictac.{Square, State}

  # ui is a function passed when starting the game
  def start(ui) do
    {:ok, game} = State.new(ui)
    player = ui.(game, :get_player)
    {:ok, game} = State.event(game, {:choose_p1, player})
    game
  end

  def check_player(player) when player in @players do
    {:ok, player}
  end

  def check_player(_), do: {:error, :invalid_player}

  def place_piece(board, place, player) do
    case board[place] do
      nil -> {:error, :invalid_place}
      :empty -> {:ok, %{board | place => player}}
      _ -> {:error, :occupied}
    end
  end

  def play_at(board, col, row, player) do
    with {:ok, valid_player} <- check_player(player),
         {:ok, square} <- Square.new(col, row),
         {:ok, new_board} <- place_piece(board, square, valid_player),
         do: new_board
  end
end
