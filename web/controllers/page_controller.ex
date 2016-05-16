defmodule TriviaPhoenix.PageController do
  
  use TriviaPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
