defmodule BumperCrop.HarvestClientCase do
  @moduledoc """
  Case for tests that require configuration of the client to point to a fake Harvest API server for testing
  """

  use ExUnit.CaseTemplate
  alias BumperCrop.FakeHarvestServer

  setup do
    start_supervised({Plug.Cowboy, scheme: :http, plug: FakeHarvestServer, options: [port: 4008]})

    client = BumperCrop.client("api_token", "account_id", "http://localhost:4008/v2")
    {:ok, client: client}
  end
end
