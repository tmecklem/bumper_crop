defmodule BumperCrop.Report.Time.TeamReportTest do
  @moduledoc false
  use BumperCrop.HarvestClientCase

  alias BumperCrop.Report.Time, as: TimeReport
  alias BumperCrop.UserResult

  describe "get_team_time_report" do
    test "it forms a correct request and returns a time report by user", %{client: client} do
      expected_total_hours = Decimal.from_float(180.0)

      assert {:ok,
              [
                %UserResult{user_name: "Trimothy Park'em", total_hours: ^expected_total_hours}
                | _
              ]} =
               TimeReport.get_team_time_report(client, from: ~D[2022-11-01], to: ~D[2022-11-30])
    end
  end
end
