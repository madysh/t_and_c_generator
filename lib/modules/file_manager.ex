defmodule FileManager do
  def load_file(file) do
    case File.read(file) do
      {:ok, body} ->
        body

      {:error, reason} ->
        exit("Error: error reading file #{file} - #{reason}")
    end
  end

  def load_json(file) do
    case Jason.decode(load_file(file)) do
      {:ok, body} ->
        body

      {:error, _} ->
        exit("Error: error decoding JSON file #{file}")
    end
  end
end
