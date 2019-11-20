defmodule ApiClientTest do
  use ExUnit.Case
  doctest ApiClient

  test "greets the world" do
    assert ApiClient.hello() == :world
  end
end
