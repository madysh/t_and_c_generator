defmodule FileManagerTest do
  use ExUnit.Case

  describe "#load_file" do
    test "loads a file" do
      template_file = "./test/fixtures/template.txt"

      assert FileManager.load_file(template_file) == File.read!(template_file)
    end

    test "exit application if the file does not exist" do
      exit_output = catch_exit(FileManager.load_file("non_existent_file.txt"))

      assert exit_output ==
               "Error: error reading file non_existent_file.txt - enoent"
    end
  end

  describe "#load_json" do
    test "loads a json into a Map" do
      json_file = "./test/fixtures/json_test.json"

      assert FileManager.load_json(json_file) == %{"id" => "value"}
    end

    test "exit application if the json is not parsable" do
      invalid_json_file = "./test/fixtures/json_invalid_test.txt"

      exit_output = catch_exit(FileManager.load_json(invalid_json_file))

      assert exit_output ==
               "Error: error decoding JSON file #{invalid_json_file}"
    end
  end
end
