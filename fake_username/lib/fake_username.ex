defmodule FakeUsername do
  def get(name) do
    name
    |> String.downcase()
    |> String.split()
    |> Enum.join()
  end
end
