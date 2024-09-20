defmodule Section do
  @marker "SECTION"

  def replace(template, sections) do
    sections = FileManager.load_json(sections)

    Enum.reduce(sections, template, fn section, acc ->
      clauses = section_clauses(section["clauses_ids"])
      String.replace(acc, "[#{@marker}-#{section["id"]}]", clauses)
    end)
  end

  defp section_clauses(clauses_ids) do
    clauses_ids
    |> Enum.map(fn clause_id -> "[#{Clause.marker()}-#{clause_id}]" end)
    |> Enum.join(";")
  end
end
