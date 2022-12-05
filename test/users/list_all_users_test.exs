defmodule BumperCrop.Projects.ListAllUsersTest do
  @moduledoc false
  use BumperCrop.HarvestClientCase

  alias BumperCrop.{
    User,
    Users
  }

  describe "list_all_users" do
    test "it forms a correct request and returns a list of users", %{client: client} do
      assert {:ok,
              [
                %User{
                  id: 4_371_354,
                  first_name: "Trimtothy",
                  last_name: "Morklan",
                  is_active: true,
                  roles: ["Design"]
                }
                | _
              ]} = Users.list_all_users(client, is_active: true, per_page: 2000)
    end
  end
end
