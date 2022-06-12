defmodule FactualTest do
  use ExUnit.Case
  doctest Factual

  test "greets the world" do
    assert Factual.hello() == :world
  end
end
