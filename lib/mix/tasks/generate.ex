defmodule Mix.Tasks.Generate do
  use Mix.Task

  @shortdoc "Calls the generate function from the TAndCGenerator module"

  def run(args) do
    [template, sections, clauses] = fill_defaults(args)

    TAndCGenerator.generate(
      template || "./data/template.txt",
      sections || "./data/sections.json",
      clauses || "./data/clauses.json"
    )
  end

  defp fill_defaults(args) do
    args ++ List.duplicate(nil, 3 - length(args)) |> Enum.take(3)
  end
end
