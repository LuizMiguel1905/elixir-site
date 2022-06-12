defmodule Alexandria.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :email, :password, :password_confirmation])
    |> validate_required([:name, :email, :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
  end
end
