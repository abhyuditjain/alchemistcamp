defmodule MiniMarkdown do
  def to_html(text) do
    text
    |> bold()
    |> italics()
    |> paragraph()
    |> h2()
    |> h1()
  end

  def test_str do
    """
    # Heading 1

    ## Heading 2

    I *so* enjoyed eating that burrito and the hot sauce was **amaaazing**!
    What did you think of it?

    asdf
    """
  end

  def italics(text) do
    Regex.replace(~r/\*(.*)\*/, text, "<em>\\1</em>")
  end

  def bold(text) do
    Regex.replace(~r/\*\*(.*)\*\*/, text, "<strong>\\1</strong>")
  end

  def paragraph(text) do
    Regex.replace(~r/(\r\n|\r|\n|^)+([^\r\n]+)((\r\n|\r|\n)+$)?/, text, "<p>\\2</p>")
  end

  def h1(text) do
    Regex.replace(~r/\#[\s]*(.*)((\r\n|\r|\n)+$)?/, text, "<h1>\\1</h1>")
  end

  def h2(text) do
    Regex.replace(~r/\##[\s]*(.*)((\r\n|\r|\n)+$)?/, text, "<h2>\\1</h2>")
  end
end
