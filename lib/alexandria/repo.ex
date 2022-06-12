defmodule Alexandria.Repo do
  use Ecto.Repo,
    otp_app: :alexandria,
    adapter: Ecto.Adapters.Postgres
end
