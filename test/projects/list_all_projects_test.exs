defmodule BumperCrop.Projects.ListAllProjectsTest do
  @moduledoc false
  use BumperCrop.HarvestClientCase

  alias BumperCrop.{
    Project,
    Projects
  }

  describe "list_all_projects" do
    test "it forms a correct request and returns a list of projects", %{client: client} do
      assert {:ok,
              [
                %Project{
                  name: "Acme App",
                  is_active: true,
                  starts_on: ~D[2022-01-03],
                  ends_on: ~D[2022-12-30]
                }
                | _
              ]} = Projects.list_all_projects(client, is_active: true, per_page: 2000)
    end
  end
end
