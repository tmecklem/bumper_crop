defmodule BumperCrop.Projects do
  @moduledoc """
  This module encapsulates calls to the Harvest projects resources API
  """

  @max_per_page 2000

  use Tesla

  alias BumperCrop.Project
  alias Tesla.Client

  @callback list_all_projects(Client.t(), list()) :: {:ok, list(Project.t())}

  def list_all_projects(%Client{} = client, opts \\ []) do
    is_active = Keyword.get(opts, :is_active, true)
    per_page = Keyword.get(opts, :per_page, @max_per_page)

    client
    |> get("/projects",
      query: [
        is_active: is_active,
        per_page: per_page
      ]
    )
    |> case do
      {:ok, %Tesla.Env{status: 200, body: %{"projects" => projects}}} ->
        {:ok,
         projects
         |> Enum.map(&Project.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
