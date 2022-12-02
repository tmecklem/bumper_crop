defmodule BumperCrop.FakeTimeReportsApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_get_team_time_report(conn, %{"from" => _from, "to" => _to}) do
    response_body = ~s"""
    {
      "results": [
        {
            "user_id": 3035642,
            "user_name": "Trimothy Park'em",
            "is_contractor": false,
            "total_hours": 180.0,
            "billable_hours": 134.0,
            "currency": "USD",
            "billable_amount": 10100.0
        }
      ],
      "per_page": 200,
      "total_pages": 1,
      "total_entries": 24,
      "next_page": null,
      "previous_page": null,
      "page": 1
    }
    """

    conn
    |> send_resp(200, response_body)
  end
end
