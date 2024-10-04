defmodule FileManager do
  def load_file(file) do
    File.read!(file)
  end

  def load_json(file) do
    Jason.decode!(load_file(file))
  end
end
