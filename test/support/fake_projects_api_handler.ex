defmodule BumperCrop.FakeProjectsApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_list_all_projects(conn, %{} = _params) do
    response_body = ~s"""
      {
        "projects":
          [
            {
              "id": 34735624,
              "name": "Acme App",
              "code": "",
              "is_active": true,
              "is_billable": false,
              "is_fixed_fee": false,
              "bill_by": "none",
              "budget": null,
              "budget_by": "none",
              "budget_is_monthly": false,
              "notify_when_over_budget": false,
              "over_budget_notification_percentage": 80.0,
              "show_budget_to_all": false,
              "created_at": "2022-11-14T12:15:40Z",
              "updated_at": "2022-11-14T12:15:40Z",
              "starts_on": "2022-01-03",
              "ends_on": "2022-12-30",
              "over_budget_notification_date": null,
              "notes": "",
              "cost_budget": null,
              "cost_budget_include_expenses": false,
              "hourly_rate": null,
              "fee": null,
              "client": {
                "id": 8236533,
                "name": "Kerbal Space Program",
                "currency": "USD"
              }
            }
          ],
        "per_page": 2000,
        "total_pages": 1,
        "total_entries": 21,
        "page": 1
      }
    """

    conn
    |> send_resp(200, response_body)
  end
end
