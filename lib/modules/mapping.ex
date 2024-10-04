defmodule Mapping do
  def replace(text, mappings) do
    Enum.each(mappings, fn {k, v} ->
      replace_key(text, [k], v)
    end)
  end

  defp replace_key(text, keys, value) do
    if is_map(value) do
      Enum.each(value, fn {k, v} ->
        replace_key(text, keys++[k], v)
      end)
    else
      String.replace(text, "@{ #{Enum.join(keys, ".")} }", Integer.to_string(value))
    end
  end
end
