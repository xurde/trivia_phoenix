use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :trivia_phoenix, TriviaPhoenix.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :trivia_phoenix, TriviaPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgrelixir",
  password: "postgres",
  database: "trivia_phoenix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
