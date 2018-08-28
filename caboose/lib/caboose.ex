defmodule Caboose do
  @default_lines 10

  def start(parsed, filename, invalid) do
    help_flag = Enum.member?(parsed, {:help, true})
    if invalid != [] or Enum.count(filename) !== 1 or help_flag do
      unless help_flag, do: IO.puts("Bad input\n")
      show_help()
    else
      flags = Enum.into(parsed, %{})
      # IO.inspect(parsed)
      read_file(filename, flags)
    end
  end

  defp show_help() do
    IO.puts("""
    Usage: [filename] -[flags]
    Flags
    --lines [number]    Display the last `n` lines of a file
    --help              Displays this message
    -n                  Same as --lines
    -h                  Same as --help

    If no flags are specified, caboose displays last 10 lines

    Example usage:

    caboose somefile.txt
    caboose somefile.txt -n 100
    """)
  end

  defp read_file(filename, flags) do
    body = File.read!(filename)
    lines = String.split(body, ~r{(\r\n|\n|\r)})
    num_displayed = if flags[:lines], do: flags[:lines], else: @default_lines
    # IO.inspect({filename, flags, num_displayed})

    lines
    # -ve means from end
    |> Enum.take(-num_displayed)
    |> Enum.join("\n")
    |> IO.puts()
  end
end
