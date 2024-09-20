defmodule FileManager do
  def load_file(file) do
    {:ok, content} = File.read(file)

    content
  end

  def load_json(file) do
    {:ok, data} = Jason.decode(load_file(file))

    data
  end
end
