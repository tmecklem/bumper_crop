defmodule BumperCrop.Invoices do
  @moduledoc """
  This module encapsulates calls to the Harvest invoices resources API
  """

  @max_per_page 2000

  use Tesla

  alias BumperCrop.Invoice
  alias Tesla.Client

  @callback list_all_invoices(Client.t(), list()) :: {:ok, list(Invoice.t())}

  defp add_query_param(query, _opts, nil), do: query
  defp add_query_param(query, opts, param), do: add_param_if_present(query, opts, param)

  defp add_param_if_present(query, opts, param) do
    case Keyword.has_key?(opts, param) do
      true -> query ++ [{param, Keyword.get(opts, param)}]
      false -> query
    end
  end

  def list_all_invoices(%Client{} = client, opts \\ []) do
    per_page = Keyword.get(opts, :per_page, @max_per_page)

    query =
      [per_page: per_page]
      |> add_query_param(opts, :client_id)
      |> add_query_param(opts, :project_id)
      |> add_query_param(opts, :updated_since)
      |> add_query_param(opts, :from)
      |> add_query_param(opts, :to)
      |> add_query_param(opts, :state)
      |> add_query_param(opts, :page)

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
