defmodule Clause do
  @marker "CLAUSE"

  def marker, do: @marker

  def replace(template, clauses, mapping) do
    clauses = FileManager.load_json(clauses)
    mappings = FileManager.load_json(mapping)

    Enum.reduce(clauses, template, fn clause, acc ->
      value = Mapping.replace(clause["text"], mappings)

      String.replace(acc, "[#{marker()}-#{clause["id"]}]", value, global: false)
    end)
    |> replace_misseing_tags()
  end

  defp replace_misseing_tags(template) do
    String.replace(template, ~r/\[(CLAUSE)-(\d+)\]/, "")
  end
end
