defmodule Mapping do
  def replace(text, mappings) do
    Enum.reduce(mappings, text, fn {k, v}, acc ->
      replace_key(acc, [k], v)
    end)
  end

  defp replace_key(text, keys, value) do
    if is_map(value) do
      Enum.reduce(value, text, fn {k, v}, acc ->
        replace_key(acc, keys ++ [k], v)
      end)
    else
      String.replace(text, "@{ #{Enum.join(keys, ".")} }", Integer.to_string(value))
    end
  end
end
