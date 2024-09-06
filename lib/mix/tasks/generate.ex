defmodule Mix.Tasks.Generate do
  use Mix.Task

  @shortdoc "Calls the generate function from the TAndCGenerator module"

  def run(_) do
    TAndCGenerator.generate()
  end
end
