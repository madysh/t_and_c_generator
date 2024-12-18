defmodule ClauseTest do
  use ExUnit.Case

  test "replaces a clause" do
    template = "This is a [CLAUSE-1] [CLAUSE-100]."
    expected = "This is a The quick brown @{ count } foxes [CLAUSE-100]."

    assert Clause.replace(template, "./test/fixtures/clauses.json") == expected
  end
end
