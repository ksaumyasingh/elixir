defmodule BlogWeb.Plugs.Locale do
  import Plug.Conn
  @locales ["en", "fr", "de"]

  def init(default), do: default
#doubt in first parameter
  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
    assign(conn, :locale, loc)
  end

  def call(conn, default) do
    assign(conn, :locale, default)
  end
end
defmodule HelloWeb.Plugs.Locale do
  import Plug.Conn
  @locales ["en", "fr", "de"]

  def init(default), do: default
#doubt in first parameter
  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
    assign(conn, :locale, loc)
  end

  def call(conn, default) do
    assign(conn, :locale, default)
  end
end
