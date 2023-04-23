defmodule IpMajor.Repo.Migrations.AlterProfiles do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :role, :string #admin, user
    end
  end
end
