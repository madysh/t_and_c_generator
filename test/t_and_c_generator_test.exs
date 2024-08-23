defmodule TAndCGeneratorTest do
  use ExUnit.Case
  doctest TAndCGenerator

  test "greets the world" do
    assert TAndCGenerator.hello() == :world
  end
end
