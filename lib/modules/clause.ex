defmodule Clause do
  @marker "CLAUSE"

  def marker, do: @marker

  def replace(template, clauses, mapping) do
    clauses = FileManager.load_json(clauses)
    mappings = FileManager.load_json(mapping)
    clause_ids = Enum.map(clauses, fn x -> x["id"] end)

    Enum.reduce(clauses, template, fn clause, acc ->
      value = Mapping.replace(clause["text"], mappings)

      String.replace(acc, "[#{marker()}-#{clause["id"]}]", value, global: false)
    end)
    |> replace_misseing_tags(clause_ids)
  end

  defp replace_misseing_tags(template, clause_ids) do
    String.replace(template, ~r/\[CLAUSE-(\d+)\]/, fn match ->
      case Regex.run(~r/\d+/, match) do
        [digit] ->
          id = String.to_integer(digit)

          if id in clause_ids do
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
