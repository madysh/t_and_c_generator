defmodule TAndCGenerator do
  @clauses File.read!("data/clauses.json") |> Jason.decode!()
  @sections File.read!("data/sections.json") |> Jason.decode!()

  def generate do
    File.stream!("data/template.txt")
    |> Enum.each(&parse_line/1)
  end

  defp parse_line(line) do
    case Regex.run(~r/\[(CLAUSE|SECTION)-(\d+)\]/, line) do
      [match, "SECTION", id] ->
        String.replace(line, match, section_composer(String.to_integer(id)))

      [match, "CLAUSE", id] ->
        String.replace(line, match, clause_composer(String.to_integer(id)))

      nil ->
        line
    end
    |> IO.puts()
  end

  defp section_composer(id) do
    case find_by_id(@sections, id) do
      %{"id" => _, "clauses_ids" => clauses_ids} ->
        clauses_ids
        |> Enum.map(&clause_composer/1)
        |> Enum.join(" ")

      _ ->
        ""
    end
  end

  defp clause_composer(id) do
    case find_by_id(@clauses, id) do
      %{"id" => _, "text" => text} -> text
      _ -> ""
    end
  end

  defp find_by_id(data, id) do
    Enum.find(data, fn %{"id" => json_id} ->
      json_id == id
    end)
  end
end
