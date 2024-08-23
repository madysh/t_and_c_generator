defmodule TAndCGenerator do
  def generate do
    _template = load_file("template.txt")
    _sections = load_json(:sections)
    _clauses = load_json(:clauses)
  end

  def load_file(file) do
    {:ok, content} = File.read("data/#{file}")

    content
  end

  def load_json(file) do
    {:ok, data} = Jason.decode(load_file("#{file}.json"))

    data
  end
end
