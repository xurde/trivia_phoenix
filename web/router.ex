defmodule TriviaPhoenix.Router do
  use TriviaPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", TriviaPhoenix do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    get    "/login",  SessionController, :new
    post   "/login",  SessionController, :create
    delete "/logout", SessionController, :delete
    resources "/users", UserController, only: [:new, :create]
  end


end
