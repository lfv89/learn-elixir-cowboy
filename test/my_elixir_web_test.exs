defmodule MyElixirWebTest do
  use ExUnit.Case
  doctest MyElixirWeb

  test "greets the world" do
    assert MyElixirWeb.hello() == :world
  end
end
