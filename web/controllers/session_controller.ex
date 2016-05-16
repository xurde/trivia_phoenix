defmodule TriviaPhoenix.SessionController do

  use TriviaPhoenix.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case TriviaPhoenix.Session.login(session_params, TriviaPhoenix.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in successfully")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:info, "Invalid login credentials")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end

end
