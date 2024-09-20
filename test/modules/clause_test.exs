defmodule ClauseTest do
  use ExUnit.Case
  doctest Clause

  test "replaces a clause" do
    template = "This is a [CLAUSE-1] [CLAUSE-100]."
    expected = "This is a The quick brown fox [CLAUSE-100]."

    assert Clause.replace(template, "./data/clauses.json") == expected
  end
end
