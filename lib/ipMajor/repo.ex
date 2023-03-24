defmodule IpMajor.Repo do
  use Ecto.Repo,
    otp_app: :ipMajor,
    adapter: Ecto.Adapters.Postgres
end
