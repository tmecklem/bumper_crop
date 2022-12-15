defmodule BumperCrop.TimeEntries do
  @moduledoc """
  This module encapsulates calls to the Harvest time entries resources API
  """

  @max_per_page 2000

  use Tesla

  alias BumperCrop.TimeEntry
  alias Tesla.Client

  @callback list_all_time_entries(Client.t(), list()) :: {:ok, list(TimeEntry.t())}

  def list_all_time_entries(%Client{} = client, opts \\ []) do
    from = Keyword.get(opts, :from)
    to = Keyword.get(opts, :to)
    per_page = Keyword.get(opts, :per_page, @max_per_page)

    client
    |> get("/time_entries",
      query: [
        from: from,
        to: to,
        per_page: per_page
      ]
    )
    |> case do
      {:ok, %Tesla.Env{status: 200, body: %{"time_entries" => time_entries}}} ->
        {:ok,
         time_entries
         |> Enum.map(&TimeEntry.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
