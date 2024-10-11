defmodule Section do
  @marker "SECTION"

  def replace(template, sections) do
    sections = FileManager.load_json(sections)

    Enum.reduce(sections, template, fn section, acc ->
      clauses = section_clauses(section["clauses_ids"])
      String.replace(acc, "[#{@marker}-#{section["id"]}]", clauses, global: false)
    end)
    |> replace_misseing_tags()
  end

  defp section_clauses(clauses_ids) do
    clauses_ids
    |> Enum.map(fn clause_id -> "[#{Clause.marker()}-#{clause_id}]" end)
    |> Enum.join(";")
  end

  defp replace_misseing_tags(template) do
    String.replace(template, ~r/\[(SECTION)-(\d+)\]/, "")
  end
end
