defmodule TAndCGenerator do
  def generate(template, sections, clauses, mapping) do
    template
    |> FileManager.load_file()
    |> Section.replace(sections)
    |> Clause.replace(clauses)
    |> Mapping.replace(mapping)
    |> IO.puts()
  end
end
