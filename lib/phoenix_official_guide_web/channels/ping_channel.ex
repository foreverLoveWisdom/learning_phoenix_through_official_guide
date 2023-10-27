defmodule PhoenixOfficialGuideWeb.PingChannel do
  use PhoenixOfficialGuideWeb, :channel

  def join(_topic, _payload, socket) do
    {:ok, socket}
  end

  def handle_in("ping", _payload, socket) do
    {:reply, {:ok, %{ping: "pong"}}, socket}
  end
end
