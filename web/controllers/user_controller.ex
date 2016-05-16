defmodule TriviaPhoenix.UserController do

  use TriviaPhoenix.Web, :controller
  alias TriviaPhoenix.User

  plug :scrub_params, "user" when action in [:create, :update]

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case TriviaPhoenix.User.create(changeset, TriviaPhoenix.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: session_path(conn, :new))
      {:error, changeset} ->
        IO.puts("DEBUG :: UserController.create")
        IO.inspect(changeset)
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
  end

end
