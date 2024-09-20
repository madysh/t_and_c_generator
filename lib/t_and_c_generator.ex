defmodule TAndCGenerator do
  def generate(template, sections, clauses) do
    template
    |> load_file()
    |> replace_sections(sections)
    |> replace_clauses(clauses)
    |> IO.puts()
  end

  defp replace_clauses(template, clauses) do
    clauses = load_json(clauses)

    Enum.reduce(clauses, template, fn clause, acc ->
      String.replace(acc, "[CLAUSE-#{clause["id"]}]", clause["text"])
    end)
  end

  defp replace_sections(template, sections) do
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
