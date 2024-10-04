defmodule TAndCGenerator do
  def generate(template, sections, clauses, mapping) do
    template
    |> FileManager.load_file()
    |> Section.replace(sections)
    |> Clause.replace(clauses, mapping)
    |> replace_misseing_tags()
    |> IO.puts()
  end

  defp replace_misseing_tags(template) do
    String.replace(template, ~r/\[(CLAUSE|SECTION)-(\d+)\]/, "")
  end
end
