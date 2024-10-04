defmodule TAndCGeneratorTest do
  use ExUnit.Case

  test "replaces the ttemplate" do
    expected = """
A T&C Document

This document is made of plaintext.
Is made of And dies.
Is made of The white horse is white.
Is made of The quick brown fox;jumps over the lazy dog.

Your legals.

"""

    assert ExUnit.CaptureIO.capture_io(fn -> TAndCGenerator.generate("./data/template.txt", "./data/sections.json", "./data/clauses.json", "./data/mappings.json"); :foo end) == expected
  end
end
