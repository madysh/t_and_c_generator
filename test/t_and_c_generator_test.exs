defmodule TAndCGeneratorTest do
  use ExUnit.Case

  test "replaces the ttemplate" do
    expected = """
    A T&C Document

    This document is made of plaintext.
    Is made of And dies[CLAUSE-3].
    Is made of The white horse is white.
    Is made of The quick brown 2 foxes;jumps over the lazy 3 dogs.

    Your legals.

    """

    assert ExUnit.CaptureIO.capture_io(fn ->
             TAndCGenerator.generate(
               "./data/template.txt",
               "./data/sections.json",
               "./data/clauses.json",
               "./data/mapping.json"
             )

             :foo
           end) == expected
  end
end
