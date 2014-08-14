defmodule PhoenixMustache.Engine do
  @behaviour Phoenix.Template.Engine

  def precompile(file_path, tpl_name) do
    compiled = Mustache.compile_file(file_path) |> Macro.to_string

    quote do
      def render(unquote(tpl_name), assigns) do
        {result, _} = Code.eval_string(unquote(compiled), [mustache_root: assigns])
        result
      end
    end
  end
end
