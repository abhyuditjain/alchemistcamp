matcher = ~r{\.(jpg|jpeg|png|bmp|gif)$}

matched_files =
  File.ls!()
  |> Enum.filter(&Regex.match?(matcher, &1))

num_matched = Enum.count(matched_files)

msg_end =
  case num_matched do
    1 -> "file"
    _ -> "files"
  end

IO.puts("Matched #{num_matched} #{msg_end}")

case File.exists?("images/") do
  false ->
    IO.puts(~s{"images" folder doesn't exist. Creating one....\n})

    case File.mkdir("./images") do
      :ok ->
        IO.puts(~s{"images" folder created successfully\n})

      {:error, reason} ->
        IO.puts(~s{error creating "images folder". Error: #{:file.format_error(reason)}\n})
        System.halt(0)
    end

  true ->
    IO.puts(~s{"images" folder found\n})
end

Enum.each(matched_files, fn filename ->
  case(File.rename(filename, "./images/#{filename}")) do
    :ok -> IO.puts(~s{File "#{filename}" moved successfully\n})
    {:error, _} -> IO.puts(~s{Error moving file "#{filename}"\n})
  end
end)
