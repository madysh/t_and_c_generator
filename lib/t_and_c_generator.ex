defmodule TAndCGenerator do
  def generate do
    template = load_template()
    sections = load_json(:sections)
    clauses = load_json(:clauses)
  end

  def load_template() do
    {:ok, json_content} = File.read("data/template.txt")
    json_content
  end

  def load_json(file) do
    {:ok, json_content} = File.read("data/#{file}.json")
    {:ok, data} = Jason.decode(json_content)

    data
  end
end
