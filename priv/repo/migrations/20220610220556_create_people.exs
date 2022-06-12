defmodule Alexandria.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :email, :string
      add :password, :string


      timestamps()
    end
  end
end
