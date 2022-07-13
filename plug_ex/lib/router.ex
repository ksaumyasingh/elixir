defmodule PlugEx.Router do
    use Plug.Router
    plug :match
    plug :dispatch

    get "/" do
        send_resp(conn, 200, "Hello There!")
    end

    match _, do: send_resp(conn, 404, "404 error not found!")
end