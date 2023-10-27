defmodule PhoenixOfficialGuideWeb.PageController do
  use PhoenixOfficialGuideWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  plug PhoenixOfficialGuideWeb.Plugs.Locale, "en" when action in [:index]
end
