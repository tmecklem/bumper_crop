defmodule BumperCrop.Users do
  @moduledoc """
  This module encapsulates calls to the Harvest users resources API
  """

  @max_per_page 2000

  use Tesla

  alias BumperCrop.User
  alias Tesla.Client

  @callback list_all_users(Client.t(), list()) :: {:ok, list(User.t())}

  def list_all_users(%Client{} = client, opts \\ []) do
    is_active = Keyword.get(opts, :is_active, true)
    per_page = Keyword.get(opts, :per_page, @max_per_page)

    client
    |> get("/users",
      query: [
        is_active: is_active,
        per_page: per_page
      ]
    )
    |> case do
      {:ok, %Tesla.Env{status: 200, body: %{"users" => users}}} ->
        {:ok,
         users
         |> Enum.map(&User.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
