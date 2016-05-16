defmodule TriviaPhoenix.User do
  use TriviaPhoenix.Web, :model
  use Ecto.Model.Callbacks
  import Ecto.Changeset #, only: [put_change: 3]

  schema "users" do
    field :username, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    field :email, :string
    timestamps
  end

  @required_fields ~w(username email password)
  @optional_fields ~w()

  def create(changeset, repo) do
  changeset
    |> put_change(:crypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  defp hashed_password(password) do
    hashed_pass = Comeonin.Bcrypt.hashpwsalt(password)
    IO.puts("hashed_pass: #{hashed_pass}")
    hashed_pass
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end

end
