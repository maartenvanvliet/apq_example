defmodule ApqExampleTest do
  use ExUnit.Case
  doctest ApqExample

  test "greets the world" do
    assert ApqExample.hello() == :world
  end
end
