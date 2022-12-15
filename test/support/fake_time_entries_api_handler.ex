defmodule BumperCrop.FakeTimeEntriesApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_list_all_time_entries(conn, %{} = _params) do
    response_body = ~s"""
        {
          "time_entries": [
            {
              "id": 1946720349,
              "spent_date": "2022-11-30",
              "hours": 4.0,
              "hours_without_timer": 4.0,
              "rounded_hours": 4.0,
              "notes": null,
              "is_locked": false,
              "locked_reason": null,
              "is_closed": false,
              "is_billed": false,
              "timer_started_at": null,
              "started_time": null,
              "ended_time": null,
              "is_running": false,
              "billable": true,
              "budgeted": false,
              "billable_rate": null,
              "cost_rate": null,
              "created_at": "2022-12-01T15:45:52Z",
              "updated_at": "2022-12-01T15:45:52Z",
              "user": {
                "id": 1354365,
                "name": "Christopher Kringle"
              },
              "client": {
                "id": 8246435,
                "name": "Rocket Dogs Unlimited",
                "currency": "USD"
              },
              "project": {
                "id": 34635646,
                "name": "Leashes Unleashed",
                "code": ""
              },
              "task": {
                "id": 1463253,
                "name": "Research"
              },
              "user_assignment": {
                "id": 336426466,
                "is_project_manager": false,
                "is_active": true,
                "use_default_rates": true,
                "budget": null,
                "created_at": "2022-03-01T18:42:13Z",
                "updated_at": "2022-03-01T18:42:13Z",
                "hourly_rate": null
              },
              "task_assignment": {
                "id": 346636455,
                "billable": false,
                "is_active": true,
                "created_at": "2022-03-01T18:42:13Z",
                "updated_at": "2022-03-01T18:42:13Z",
                "hourly_rate": null,
                "budget": null
              },
              "invoice": {
                "id": 33634545,
                "number": "1111"
              },
              "external_reference": null
            }
          ],
          "per_page": 2000,
          "total_pages": 1,
          "total_entries": 37,
          "next_page": null,
          "previous_page": null,
          "page": 1
        }
    """

    conn
    |> send_resp(200, response_body)
  end
end
