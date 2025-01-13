defmodule BumperCrop.Invoices.ListAllInvoicesTest do
  @moduledoc false
  use BumperCrop.HarvestClientCase

  alias BumperCrop.{
    Invoice,
    Invoices
  }

  describe "list_all_invoices" do
    test "it forms a correct request and returns a list of invoices with pagination", %{
      client: client
    } do
      assert {:ok,
              [
                %Invoice{
                  id: 13_150_403,
                  client_key: "21312da13d457947a217da6775477afee8c2eba8",
                  number: "1001",
                  purchase_order: "",
                  amount: 288.9,
                  due_amount: 288.9,
                  tax: 5.0,
                  tax_amount: 13.5,
                  tax2: 2.0,
                  tax2_amount: 5.4,
                  discount: 10.0,
                  discount_amount: 30.0,
                  subject: "Online Store - Phase 1",
                  notes: "Some notes about the invoice.",
                  state: "open",
                  period_start: ~D[2017-03-01],
                  period_end: ~D[2017-03-01],
                  issue_date: ~D[2017-04-01],
                  due_date: ~D[2017-04-01],
                  payment_term: "upon receipt",
                  currency: "EUR"
                }
                | _
              ]} = Invoices.list_all_invoices(client, per_page: 2000, page: 1)
    end
  end
end
