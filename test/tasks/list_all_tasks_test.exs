defmodule BumperCrop.Projects.ListAllTasksTest do
  @moduledoc false
  use BumperCrop.HarvestClientCase

  alias BumperCrop.{
    Task,
    Tasks
  }

  describe "list_all_tasks" do
    test "it forms a correct request and returns a list of tasks", %{client: client} do
      assert {:ok,
              [
                %Task{
                  name: "Makin Bacon",
                  is_active: true,
                  is_default: true
                }
                | _
              ]} = Tasks.list_all_tasks(client, is_active: true, per_page: 2000)
    end
  end
end
