defmodule HelloWeb.Plugs.Locale2 do
  import Plug.Conn
  @locales ["hi", "fr", "de"]

  def init(default), do: default
#doubt in first parameter
  def call(%Plug.Conn{params: %{"locale2" => loc}} = conn, _default) when loc in @locales do
    assign(conn, :locale2, loc)
  end

  def call(conn, default) do
    assign(conn, :locale2, default)
  end
end
