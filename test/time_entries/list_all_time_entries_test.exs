defmodule BumperCrop.Projects.ListAllTimeEntriesTest do
  @moduledoc false
  use BumperCrop.HarvestClientCase

  alias BumperCrop.{
    TimeEntries,
    TimeEntry
  }

  alias BumperCrop.TimeEntry.{
    Client,
    Invoice,
    Project,
    Task,
    User
  }

  describe "list_all_time_entries" do
    test "it forms a correct request and returns a list of time_entries", %{client: client} do
      hours = Decimal.from_float(4.0)

      assert {:ok,
              [
                %TimeEntry{
                  hours: ^hours,
                  is_billed: false,
                  billable: true,
                  client: %Client{
                    name: "Rocket Dogs Unlimited"
                  },
                  invoice: %Invoice{
                    id: 33_634_545,
                    number: "1111"
                  },
                  project: %Project{
                    name: "Leashes Unleashed"
                  },
                  task: %Task{
                    name: "Research"
                  },
                  user: %User{
                    name: "Christopher Kringle"
                  }
                }
                | _
              ]} =
               TimeEntries.list_all_time_entries(client, from: ~D[2022-11-01], to: ~D[2022-11-15])
    end
  end
end
