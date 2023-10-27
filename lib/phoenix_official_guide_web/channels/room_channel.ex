defmodule PhoenixOfficialGuideWeb.RoomChannel do
  use PhoenixOfficialGuideWeb, :channel

  def join("room:lobby", _payload, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _payload, socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push(socket, "new_msg", payload)
    {:noreply, socket}
  end
end
