ExUnit.start

Mix.Task.run "ecto.create", ~w(-r TriviaPhoenix.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r TriviaPhoenix.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(TriviaPhoenix.Repo)

