defmodule BumperCrop.Invoices do
  @moduledoc """
  This module encapsulates calls to the Harvest invoices resources API
  """

  @max_per_page 2000

  use Tesla

  alias BumperCrop.Invoice
  alias Tesla.Client

  @callback list_all_invoices(Client.t(), list()) :: {:ok, list(Invoice.t())}

  def list_all_invoices(%Client{} = client, opts \\ []) do
    per_page = Keyword.get(opts, :per_page, @max_per_page)

    query =
      [per_page: per_page]
      |> then(fn query ->
        case Keyword.has_key?(opts, :client_id) do
          true -> query ++ [client_id: Keyword.get(opts, :client_id)]
          _ -> query
        end
      end)
      |> then(fn query ->
        case Keyword.has_key?(opts, :project_id) do
          true -> query ++ [project_id: Keyword.get(opts, :project_id)]
          _ -> query
        end
      end)
      |> then(fn query ->
        case Keyword.has_key?(opts, :updated_since) do
          true -> query ++ [updated_since: Keyword.get(opts, :updated_since)]
          _ -> query
        end
      end)
      |> then(fn query ->
        case Keyword.has_key?(opts, :from) do
          true -> query ++ [from: Keyword.get(opts, :from)]
          _ -> query
        end
      end)
      |> then(fn query ->
        case Keyword.has_key?(opts, :to) do
          true -> query ++ [to: Keyword.get(opts, :to)]
          _ -> query
        end
      end)
      |> then(fn query ->
        case Keyword.has_key?(opts, :state) do
          true -> query ++ [state: Keyword.get(opts, :state)]
          _ -> query
        end
      end)
      |> then(fn query ->
        case Keyword.has_key?(opts, :page) do
          true -> query ++ [page: Keyword.get(opts, :page)]
          _ -> query
        end
      end)

    client
    |> get("/invoices", query: query)
    |> case do
      {:ok, %Tesla.Env{status: 200, body: %{"invoices" => invoices}}} ->
        {:ok,
         invoices
         |> Enum.map(&Invoice.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
