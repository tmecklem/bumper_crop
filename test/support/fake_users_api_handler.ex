defmodule BumperCrop.FakeUsersApiHandler do
  @moduledoc false

  import Plug.Conn

  def handle_list_all_users(conn, %{} = _params) do
    response_body = ~s"""
    {
      "users": [
        {
          "id": 4371354,
          "first_name": "Trimtothy",
          "last_name": "Morklan",
          "email": "trimtothy.morklan@morklanassociates.example",
          "telephone": "",
          "timezone": "Eastern Time (US & Canada)",
          "weekly_capacity": 144000,
          "has_access_to_all_future_projects": false,
          "is_contractor": false,
          "is_active": true,
          "calendar_integration_enabled": false,
          "calendar_integration_source": null,
          "created_at": "2014-09-11T08:35:49Z",
          "updated_at": "2020-12-02T15:30:59Z",
          "can_create_projects": false,
          "default_hourly_rate": null,
          "cost_rate": null,
          "roles": [
            "Design"
          ],
          "access_roles": [
            "member"
          ],
          "permissions_claims": [
            "expenses:read:own",
            "expenses:write:own",
            "timers:read:own",
            "timers:write:own"
          ],
          "avatar_url": "https://d3s3969qhosaug.cloudfront.net/v2/default-avatars/5357.png"
        }
      ],
      "per_page": 100,
      "total_pages": 1,
      "total_entries": 26,
      "next_page": null,
      "previous_page": null,
      "page": 1
    }
    """

    conn
    |> send_resp(200, response_body)
  end
end
