defmodule BumperCrop.TimeEntry.TaskAssignment do
  @moduledoc """
  This struct represents a TimeEntry.TaskAssignment in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:billable, boolean())
    field(:is_active, boolean())
    field(:budget, Decimal.t())
    field(:created_at, Decimal.t())
    field(:updated_at, Decimal.t())
    field(:hourly_rate, Decimal.t())
  end

  def new(%{
        "id" => id,
        "billable" => billable,
        "is_active" => is_active,
        "budget" => budget,
        "created_at" => created_at,
        "updated_at" => updated_at,
        "hourly_rate" => hourly_rate
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        billable: billable,
        is_active: is_active,
        budget: from_float(budget),
        created_at: parse_datetime(created_at),
        updated_at_at: parse_datetime(updated_at),
        hourly_rate: from_float(hourly_rate)
      }
    )
  end

  def new(nil), do: nil

  def new(map) do
    struct(__MODULE__, map)
  end

  defp from_float(nil), do: nil
  defp from_float(float), do: Decimal.from_float(float)

  @datetime_format "{ISO:Extended:Z}"
  defp parse_datetime(nil), do: nil
  defp parse_datetime(date), do: Timex.parse!(date, @datetime_format)
end
