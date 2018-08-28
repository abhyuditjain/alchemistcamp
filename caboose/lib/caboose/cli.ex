defmodule Caboose.CLI do
  def main(args) do
    {parsed, args, invalid} =
      OptionParser.parse(
        args,
        switches: [lines: :integer, help: nil],
        aliases: [n: :lines, h: :help]
      )

    Caboose.start(parsed, args, invalid)
  end
end
