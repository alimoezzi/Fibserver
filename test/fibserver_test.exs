defmodule FibserverTest do
  use ExUnit.Case
  doctest Fibserver

  test "greets the world" do
    assert Fibserver.hello() == :world
  end
end
