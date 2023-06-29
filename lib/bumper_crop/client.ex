defmodule BumperCrop.Client do
  @moduledoc """
  This struct represents a Client in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:name, String.t())
    field(:address, String.t())
    field(:is_active, boolean())
    field(:statement_key, boolean())
    field(:currency, String.t())
    field(:created_at, DateTime.t())
    field(:updated_at, DateTime.t())
  end

  def new(%{
        "id" => id,
        "name" => name,
        "address" => address,
        "is_active" => is_active,
        "statement_key" => statement_key,
        "currency" => currency,
        "created_at" => created_at,
        "updated_at" => updated_at
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        name: name,
        address: address,
        is_active: is_active,
        statement_key: statement_key,
        currency: currency,
        created_at: parse_datetime(created_at),
        updated_at: parse_datetime(updated_at)
      }
    )
  end

  def new(map) do
    struct(__MODULE__, map)
  end

  @datetime_format "{ISO:Extended:Z}"
  defp parse_datetime(nil), do: nil
  defp parse_datetime(date), do: Timex.parse!(date, @datetime_format)
end
