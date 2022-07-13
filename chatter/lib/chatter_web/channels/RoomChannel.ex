defmodule Chatter.RoomChannel do
    use Chatter.Web, :channel
    alias Chatter.Presence

    def join("room:lobby", _, socket) do
        send self(), :after_join
        {:ok,socket}
    end

    def handle_info(:after_join, socket) do
        Presence.track(socket, socket.assigns.user, %{online_at: :os.system_time(:milli_second)})
        push socket,"Presence_state",Presence.list(socket)
        {:noreply, socket}
    end
end