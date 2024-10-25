defmodule Mapping do
  def replace(template, mappings) do
    mappings = FileManager.load_json(mappings)

    Regex.replace(~r/@{ ([\w\.]+) }\s/, template, fn _match, key ->
      case get_in(mappings, String.split(key, ".")) do
        nil -> ""
        value -> "#{value} "
      end
    end)
  end
end
