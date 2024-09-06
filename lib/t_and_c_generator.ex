defmodule TAndCGenerator do
  def generate(template, sections, clauses) do
    result = load_file(template)
    result = replace_sections(sections, result)
    result = replace_clauses(clauses, result)

    IO.puts(result)
  end

  defp replace_clauses(clauses, template) do
    clauses = load_json(clauses)

    Enum.reduce(clauses, template, fn clause, acc ->
      String.replace(acc, "[CLAUSE-#{clause["id"]}]", clause["text"])
    end)
  end

  defp replace_sections(sections, template) do
    sections = load_json(sections)

    Enum.reduce(sections, template, fn section, acc ->
      clauses = section_clauses(section["clauses_ids"])
      String.replace(acc, "[SECTION-#{section["id"]}]", clauses)
    end)
  end

  defp section_clauses(clauses_ids) do
    clauses_ids
    |> Enum.map(fn clause_id -> "[CLAUSE-#{clause_id}]" end)
    |> Enum.join(";")
  end

  defp load_file(file) do
    {:ok, content} = File.read(file)

    content
  end

  defp load_json(file) do
    {:ok, data} = Jason.decode(load_file(file))

    data
  end
end
