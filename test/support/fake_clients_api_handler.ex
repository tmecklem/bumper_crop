defmodule BumperCrop.FakeClientsApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_list_all_clients(conn, %{} = _params) do
    response_body = ~S"""
      {
        "clients": [
          {
            "id": 4371354,
            "name": "ACME Useful Corp",
            "is_active": true,
            "address": "123000000 Main Street\r\nCincinnati, OH 45202",
            "statement_key": "264454abc",
            "created_at": "2020-06-23T15:40:02Z",
            "updated_at": "2022-06-23T17:54:26Z",
            "currency": "USD"
          },
          {
            "id": 2446345345,
            "name": "The Other Client",
            "is_active": false,
            "address": null,
            "statement_key": "awdgklj34",
            "created_at": "2023-06-12T16:07:34Z",
            "updated_at": "2023-06-16T19:02:48Z",
            "currency": "CAN"
          }
        ],
        "per_page": 2000,
        "total_pages": 1,
        "total_entries": 2,
        "next_page": null,
        "previous_page": null,
        "page": 1,
        "links": {
          "first": "https://api.harvestapp.com/v2/clients?page=1&per_page=2000&ref=first",
          "next": null,
          "previous": null,
          "last": "https://api.harvestapp.com/v2/clients?page=1&per_page=2000&ref=last"
        }
      }
    """

    conn
    |> send_resp(200, response_body)
  end
end
