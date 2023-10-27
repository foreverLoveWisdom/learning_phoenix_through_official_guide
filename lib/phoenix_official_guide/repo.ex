defmodule PhoenixOfficialGuide.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_official_guide,
    adapter: Ecto.Adapters.Postgres
end
