filename =
  IO.gets("Filename from which you want the count (h for help): ")
  |> String.trim()

if filename == "h" do
  IO.puts("""
  Usage: [filename] -[flags]
  Flags
  - l     Displays the line count
  - c     Displays the character count
  - w     Displays the word count (default)

  Multiple flags can be used. Example to get word and character count

  somefile.txt -wc

  """)
else
  parts = filename |> String.split("-")

  flags =
    case Enum.at(parts, 1) do
      nil -> ["w"]
      chars -> String.split(chars, "") |> Enum.filter(&(&1 != ""))
    end

  file = List.first(parts) |> String.trim()

  body = File.read!(file)
  lines = body |> String.split(~r{(\r\n|\n|\r)})

  words =
    body
    |> String.split(~r{(\\n|[\W^'])+})
    |> Enum.filter(&(&1 !== ""))

  characters = body |> String.split("") |> Enum.filter(&(&1 !== ""))

  Enum.each(flags, fn flag ->
    case flag do
      "l" -> IO.puts("Lines: #{Enum.count(lines)}")
      "w" -> IO.puts("Words: #{Enum.count(words)}")
      "c" -> IO.puts("Characters: #{Enum.count(characters)}")
      _ -> nil
    end
  end)
end
