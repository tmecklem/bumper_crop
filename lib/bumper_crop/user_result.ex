defmodule BumperCrop.UserResult do
  @moduledoc """
  This struct represents a user in Harvest time reports
  """

  use TypedStruct

  typedstruct do
    field(:user_id, integer())
    field(:user_name, String.t())
    field(:is_contractor, String.t())
    field(:total_hours, Decimal.t())
    field(:billable_hours, Decimal.t())
    field(:currency, String.t())
    field(:billable_amount, Decimal.t())
  end

  def new(%{
        "user_id" => user_id,
        "user_name" => user_name,
        "is_contractor" => is_contractor,
        "total_hours" => total_hours,
        "billable_hours" => billable_hours,
        "currency" => currency,
        "billable_amount" => billable_amount
      }) do
    struct(
      __MODULE__,
      %{
        user_id: user_id,
        user_name: user_name,
        is_contractor: is_contractor,
        total_hours: Decimal.from_float(total_hours),
        billable_hours: Decimal.from_float(billable_hours),
        currency: currency,
        billable_amount: Decimal.from_float(billable_amount)
      }
    )
  end

  def new(map) do
    struct(__MODULE__, map)
  end
end
