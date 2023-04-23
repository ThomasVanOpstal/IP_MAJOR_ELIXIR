defmodule IpMajor.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :amount, :float
      add :payment_date, :date
      add :payment_type, :string
      add :payment_status, :string
      add :payment_method, :string
      add :payment_reference, :string
      add :payment_comments, :string
      add :reservation_id, references(:reservations , on_delete: :delete_all)
      timestamps()
    end
    create unique_index(:payments, [:payment_reference])

  end
end
