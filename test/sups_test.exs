defmodule SupsTest do
  use ExUnit.Case
  doctest Sups

  test "greets the world" do
    assert Sups.hello() == :world
  end
end
