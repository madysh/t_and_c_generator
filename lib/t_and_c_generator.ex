defmodule TAndCGenerator do
  def generate(template, sections, clauses, mapping) do
    template
    |> FileManager.load_file()
    |> Section.replace(sections)
    |> Clause.replace(clauses, mapping)
    |> IO.puts()
  end
end
