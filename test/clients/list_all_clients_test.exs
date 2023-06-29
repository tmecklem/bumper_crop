defmodule BumperCrop.Projects.ListAllClientsTest do
  @moduledoc false
  use BumperCrop.HarvestClientCase

  alias BumperCrop.{
    Client,
    Clients
  }

  describe "list_all_clients" do
    test "it forms a correct request and returns a list of clients", %{client: client} do
      assert {:ok,
              [
                %Client{
                  id: 4_371_354,
                  name: "ACME Useful Corp",
                  address: "123000000 Main Street\r\nCincinnati, OH 45202",
                  is_active: true,
                  statement_key: "264454abc",
                  currency: "USD"
                }
                | _
              ]} = Clients.list_all_clients(client, per_page: 2000)
    end
  end
end
