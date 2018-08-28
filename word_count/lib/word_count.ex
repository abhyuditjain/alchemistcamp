defmodule WordCount do
  def start(parsed, file, invalid) do
    # IO.inspect(file)
    if invalid != [] or file == "h" do
      show_help()
    else
      read_file(parsed, file)
    end
  end

  defp show_help() do
    IO.puts("""
    Usage: [filename] -[flags]
    Flags
    - l     Displays the line count
    - c     Displays the character count
    - w     Displays the word count (default)

    Multiple flags can be used. Example to get word and character count

    somefile.txt -wc

    """)
  end

  defp read_file(parsed, files) do
    flags =
      case Enum.count(parsed) do
        0 -> [:words]
        _ -> Enum.map(parsed, &elem(&1, 0))
      end

    body = Enum.map(files, &File.read!/1) |> Enum.join("\n")
    lines = body |> String.split(~r{(\r\n|\n|\r)})

    words =
      body
      |> String.split(~r{(\\n|[\W^'])+})
      |> Enum.filter(&(&1 !== ""))

    characters = body |> String.split("") |> Enum.filter(&(&1 !== ""))

    Enum.each(flags, fn flag ->
      case flag do
        :lines -> IO.puts("Lines: #{Enum.count(lines)}")
        :words -> IO.puts("Words: #{Enum.count(words)}")
        :chars -> IO.puts("Characters: #{Enum.count(characters)}")
        _ -> nil
      end
    end)
  end
end
