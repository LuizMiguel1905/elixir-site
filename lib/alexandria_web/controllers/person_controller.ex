defmodule AlexandriaWeb.PersonController do
  use AlexandriaWeb, :controller

  alias Alexandria.Person
  alias Alexandria.Repo

  def index(conn, _params) do
    people = Repo.all(Person)
    render(conn, "index.html", people: people)
  end

  def new(conn, _params) do
    changeset = Person.changeset(%Person{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)
    changeset = Person.changeset(person, %{password_confirmation: person.password})
    render(conn, "edit.html", person: person, changeset: changeset)
  end

  def create(conn, %{"person" => person}) do

    changeset = Person.changeset(%Person{}, person)
    case Repo.insert(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Pessoa cadastrada com sucesso!")
        |> redirect(to: Routes.person_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :check_errors}
        render(conn, "new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "person" => person}) do
    p = Repo.get!(Person, id)
    changeset = Person.changeset(p, person)
    case Repo.update(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Pessoa atualizada com sucesso!")
        |> redirect(to: Routes.person_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", person: p, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Repo.get!(Person, id)
    {:ok, _post} = Repo.delete!(person)

    conn
      |> put_flash(:info, "Pessoa excluida com sucesso!")
      |> redirect(to: Routes.person_path(conn, :index))
  end

end
