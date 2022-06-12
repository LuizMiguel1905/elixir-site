defmodule Alexandria.Repo.Migrations.AddEmailConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:people, [:email])
  end
end
