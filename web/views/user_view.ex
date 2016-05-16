defmodule TriviaPhoenix.UserView do
  use TriviaPhoenix.Web, :view

  def render_error(error) do
    "▶︎ #{elem error, 0}: #{elem error, 1} 😁"
  end
end
