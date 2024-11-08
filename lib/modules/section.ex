defmodule Section do
  @marker "SECTION"

  def replace(template, sections) do
    sections = FileManager.load_json(sections)
    section_ids = Enum.map(sections, fn x -> x["id"] end)

    Enum.reduce(sections, template, fn section, acc ->
      clauses = section_clauses(section["clauses_ids"])
      String.replace(acc, "[#{@marker}-#{section["id"]}]", clauses, global: false)
    end)
    |> replace_missing_tags(section_ids)
  end

  defp section_clauses(clauses_ids) do
    clauses_ids
    |> Enum.map(fn clause_id -> "[#{Clause.marker()}-#{clause_id}]" end)
    |> Enum.join(";")
  end

  defp replace_missing_tags(template, section_ids) do
    String.replace(template, ~r/\[SECTION-(\d+)\]/, fn match ->
      case Regex.run(~r/\d+/, match) do
        [digit] ->
          id = String.to_integer(digit)

          if id in section_ids do
            match
          else
            ""
          end

        _ ->
          match
      end
    end)
  end
end
