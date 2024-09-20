defmodule TAndCGenerator do
  def generate(template, sections, clauses) do
    template
    |> FileManager.load_file()
    |> Section.replace(sections)
    |> Clause.replace(clauses)
    |> IO.puts()
  end
end
