defmodule BumperCrop.Clients do
  @moduledoc """
  This module encapsulates calls to the Harvest clients resources API
  """

  @max_per_page 2000

  use Tesla

  alias BumperCrop.Client, as: HarvestClient
  alias Tesla.Client

  @callback list_all_clients(Client.t(), list()) :: {:ok, list(HarvestClient.t())}

  def list_all_clients(%Client{} = client, opts \\ []) do
    per_page = Keyword.get(opts, :per_page, @max_per_page)

    query =
      [per_page: per_page]
      |> then(fn query ->
        case Keyword.has_key?(opts, :is_active) do
          true -> query ++ [is_active: Keyword.get(opts, :is_active)]
          _ -> query
        end
      end)

    client
    |> get("/clients", query: query)
    |> case do
      {:ok, %Tesla.Env{status: 200, body: %{"clients" => clients}}} ->
        {:ok,
         clients
         |> Enum.map(&HarvestClient.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
