defmodule BlogWeb.HelloController do
  use BlogWeb, :controller
  plug HelloWeb.Plugs.Locale, "fr"
  plug HelloWeb.Plugs.Locale2, "hi" when action in [:index]
  plug HelloWeb.Plugs.Locale2, "de" when action in [:show]
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
  end
end
