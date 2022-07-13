defmodule FakeUsernameTest do
  use ExUnit.Case
  doctest FakeUsername

  test "generates a username" do
    name = " My Long Random Username "
    assert FakeUsername.get(name) == "mylongrandomusername"
  end
end
