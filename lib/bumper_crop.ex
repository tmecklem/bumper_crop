defmodule BumperCrop do
  @moduledoc """
  This is the entrypoint for making requests to Harvest's API via BumperCrop
  """

  use Tesla

  defdelegate get_team_time_report(client, opts), to: BumperCrop.Report.Time
  defdelegate get_team_time_report(client), to: BumperCrop.Report.Time

  def client(api_token, account_id, base_url, opts \\ []) do
    user_agent = Keyword.get(opts, :user_agent, "BumperCrop")
    base_url = process_base(base_url)

    middleware = [
      {Tesla.Middleware.BaseUrl, base_url},
      {Tesla.Middleware.JSON, engine: Jason},
      {Tesla.Middleware.BearerAuth, token: api_token},
      {Tesla.Middleware.Headers,
       [{"harvest-account-id", account_id}, {"user-agent", user_agent}]},
      Tesla.Middleware.PathParams
    ]

    Tesla.client(middleware)
  end

  defp process_base(base_url) do
    if Regex.match?(~r/^https?:\/\//i, base_url) do
      base_url
    else
      "https://" <> base_url
    end
  end
end
