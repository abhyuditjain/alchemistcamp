defmodule AlchemyMarkdown do
  def to_html(markdown) do
    Earmark.as_html!((markdown || ""), %Earmark.Options{smartypants: false})
  end
end
