defmodule PhoenixMustacheTest do
  use ExUnit.Case
  alias Phoenix.View

  defmodule MyApp.Templates do
    use Phoenix.Template.Compiler, path: Path.join([__DIR__], "fixtures/templates")
  end

  test "render a mustache template with layout" do
    html = View.render(MyApp.Templates, "new.html",
      foo: "bar",
      within: {MyApp.Templates, "layouts/application.html"}
    )
    assert html == "<html><body><h2>bar</h2></body></html>"
  end
end
