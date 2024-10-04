defmodule Clause do
  @marker "CLAUSE"

  def marker, do: @marker

  def replace(template, clauses, mapping) do
    clauses = FileManager.load_json(clauses)
    mappings = FileManager.load_json(mapping)

    Enum.reduce(clauses, template, fn clause, acc ->
      value = Mapping.replace(clause["text"], mappings)

      String.replace(acc, "[#{marker()}-#{clause["id"]}]", value)
    end)
  end
 end
