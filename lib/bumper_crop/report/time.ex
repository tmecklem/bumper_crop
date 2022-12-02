defmodule BumperCrop.Report.Time do
  @moduledoc """
  This module encapsulates calls to the Harvest time report resources API
  """

  @max_per_page 200
  @date_format "%Y-%m-%d"

  use Tesla

  alias BumperCrop.UserResult
  alias Tesla.Client

  @callback get_team_time_report(Client.t(), list()) :: {:ok, list(UserResult.t())}

  def get_team_time_report(%Client{} = client, opts \\ []) do
    from =
      Keyword.get(
        opts,
        :from,
        Timex.now() |> Timex.shift(weeks: -1) |> Timex.beginning_of_week(:sun)
      )

    to = Keyword.get(opts, :to, Timex.now() |> Timex.shift(weeks: -1) |> Timex.end_of_week(:sun))

    per_page = Keyword.get(opts, :per_page, @max_per_page)

    client
    |> get("/reports/time/team",
      query: [
        from: Timex.format!(from, @date_format, :strftime),
        to: Timex.format!(to, @date_format, :strftime),
        per_page: per_page
      ]
    )
    |> case do
      {:ok, %Tesla.Env{status: 200, body: %{"results" => results}}} ->
        {:ok,
         results
         |> Enum.map(&UserResult.new/1)}

      {:error, env} ->
        {:error, env}
    end
  end
end
