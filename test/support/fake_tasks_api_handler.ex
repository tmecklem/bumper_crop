defmodule BumperCrop.FakeTasksApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_list_all_tasks(conn, %{} = _params) do
    response_body = ~s"""
      {
        "tasks": [
          {
            "id": 14647755,
            "name": "Makin Bacon",
            "billable_by_default": false,
            "default_hourly_rate": null,
            "is_default": true,
            "is_active": true,
            "created_at": "2022-11-14T18:05:35Z",
            "updated_at": "2022-11-14T21:05:35Z"
          },
          {
            "id": 14632009,
            "name": "Bug Fix",
            "billable_by_default": true,
            "default_hourly_rate": null,
            "is_default": false,
            "is_active": true,
            "created_at": "2022-09-23T12:18:16Z",
            "updated_at": "2022-09-23T13:18:16Z"
          }
        ],
        "per_page": 2000,
        "total_pages": 1,
        "total_entries": 2,
        "page": 1
      }
    """

    conn
    |> send_resp(200, response_body)
  end
end
