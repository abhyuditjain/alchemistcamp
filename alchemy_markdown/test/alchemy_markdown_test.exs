defmodule AlchemyMarkdownTest do
  use ExUnit.Case
  doctest AlchemyMarkdown

  test "italicizes" do
    str = "Something *important*"
    assert AlchemyMarkdown.to_html(str) =~ "<em>important</em>"
  end

  test "expands big tabs" do
    str = "some ++big++ words"
    assert AlchemyMarkdown.to_html(str) =~ "<big>big</big>"
  end

  test "expands small tabs" do
    str = "some --small-- words"
    assert AlchemyMarkdown.to_html(str) =~ "<small>small</small>"
  end
end
