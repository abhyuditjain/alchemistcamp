defmodule WordCount.CLI do
  def main(args) do
    {parsed, args, invalid} =
      OptionParser.parse(
        args,
        switches: [chars: nil, words: nil, lines: nil],
        aliases: [c: :chars, w: :words, l: :lines]
      )

    WordCount.start(parsed, args, invalid)
  end
end
