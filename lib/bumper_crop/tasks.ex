defmodule BumperCrop.Tasks do
  @moduledoc """
  This module encapsulates calls to the Harvest tasks resources API
  """

  @max_per_page 2000

  use Tesla

  alias BumperCrop.Task
  alias Tesla.Client

  @callback list_all_tasks(Client.t(), list()) :: {:ok, list(Task.t())}

  def list_all_tasks(%Client{} = client, opts \\ []) do
    is_active = Keyword.get(opts, :is_active, true)
    per_page = Keyword.get(opts, :per_page, @max_per_page)

    client
    |> get("/tasks",
      query: [
        is_active: is_active,
        per_page: per_page
      ]
    )
    |> case do
      {:ok, %Tesla.Env{status: 200, body: %{"tasks" => tasks}}} ->
        {:ok,
         tasks
         |> Enum.map(&Task.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
