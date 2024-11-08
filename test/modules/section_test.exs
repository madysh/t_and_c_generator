defmodule SectionTest do
  use ExUnit.Case

  test "replaces a section" do
    template = "This is a [SECTION-1] [SECTION-100]."
    expected = "This is a [CLAUSE-1];[CLAUSE-2] ."

    assert Section.replace(template, "./test/fixtures/sections.json") == expected
  end
end
