defmodule BumperCrop.Task do
  @moduledoc """
  This struct represents a Task in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:name, String.t())
    field(:billable_by_default, boolean())
    field(:default_hourly_rate, Decimal.t())
    field(:is_default, boolean())
    field(:is_active, boolean())
    field(:created_at, DateTime.t())
    field(:updated_at, DateTime.t())
  end

  def new(%{
        "id" => id,
        "name" => name,
        "billable_by_default" => billable_by_default,
        "default_hourly_rate" => default_hourly_rate,
        "is_default" => is_default,
        "is_active" => is_active,
        "created_at" => created_at,
        "updated_at" => updated_at
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        name: name,
        billable_by_default: billable_by_default,
        default_hourly_rate: from_float(default_hourly_rate),
        is_default: is_default,
        is_active: is_active,
        created_at: parse_datetime(created_at),
        updated_at_at: parse_datetime(updated_at)
      }
    )
  end

  def new(map) do
    struct(__MODULE__, map)
  end

  defp from_float(nil), do: nil
  defp from_float(float), do: Decimal.from_float(float)

  @datetime_format "{ISO:Extended:Z}"
  defp parse_datetime(nil), do: nil
  defp parse_datetime(date), do: Timex.parse!(date, @datetime_format)
end
