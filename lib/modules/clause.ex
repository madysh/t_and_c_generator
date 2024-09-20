defmodule Clause do
  @marker "CLAUSE"

  def marker, do: @marker

  def replace(template, clauses) do
    clauses = FileManager.load_json(clauses)

    Enum.reduce(clauses, template, fn clause, acc ->
      String.replace(acc, "[#{marker()}-#{clause["id"]}]", clause["text"])
    end)
  end
end
