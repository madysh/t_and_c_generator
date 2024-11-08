defmodule MappingTest do
  use ExUnit.Case

  test "replaces a mapping" do
    template =
      "This is a The quick brown @{ count } foxes @{ foxes.count } empty @{ foxes.not_found } [CLAUSE-100]."

    expected = "This is a The quick brown 2 foxes 3 empty [CLAUSE-100]."

    assert Mapping.replace(template, "./test/fixtures/mapping.json") == expected
  end
end
