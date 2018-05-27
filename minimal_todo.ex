defmodule MinimalTodo do
  def start do
    filename =
      IO.gets("Filename (.csv): ")
      |> String.trim()

    read(filename)
    |> parse()
    |> get_command()
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, data} ->
        data

      {:error, reason} ->
        IO.puts(~s{Couldn't open file: #{filename}\n})
        IO.puts(~s{#{:file.format_error(reason)}\n})
        start()
    end
  end

  def parse(body) do
    [headers | lines] = String.split(body, ~r{(\r\n|\n|\r)})

    titles = String.split(headers, ",") |> tl()

    parse_lines(titles, lines)
  end

  def parse_lines(titles, lines) do
    Enum.reduce(lines, %{}, fn line, acc ->
      line =
        line
        |> String.split(",")

      # IO.puts(line)

      case line do
        [""] ->
          acc

        [name | fields] ->
          map =
            Enum.zip(titles, fields)
            |> Enum.into(%{})

          Map.merge(acc, %{name => map})
      end
    end)
  end

  def show_todos(data, next_command? \\ true) do
    items = Map.keys(data)
    IO.puts("You have the following Todos:\n")
    Enum.each(items, &IO.puts/1)
    IO.puts("\n")

    if next_command? do
      get_command(data)
    end
  end

  def get_command(data) do
    prompt = """
    Type the first letter of the command you want to run:
    R)ead Todos   A)dd a Todo   D)elete a Todo   L)oad a .csv   S)ave a .csv

    """

    command =
      IO.gets(prompt)
      |> String.trim()
      |> String.downcase()

    case command do
      "r" -> show_todos(data)
      "d" -> delete_todo(data)
      "q" -> "Goodbye!"
      _ -> get_command(data)
    end
  end

  def delete_todo(data) do
    todo = IO.gets("Which Todo would you like to delete?\n") |> String.trim()

    if Map.has_key?(data, todo) do
      IO.puts("OK!\n")
      data = Map.drop(data, [todo])
      IO.puts("Todo deleted: #{todo}\n")
      get_command(data)
    else
      IO.puts("Todo not found\n")
      show_todos(data, false)
      delete_todo(data)
    end
  end
end
