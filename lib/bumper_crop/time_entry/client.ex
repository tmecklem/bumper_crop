defmodule BumperCrop.TimeEntry.Client do
  @moduledoc """
  This struct represents a TimeEntry.Client in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:name, String.t())
    field(:currency, String.t())
  end

  def new(%{
        "id" => id,
        "name" => name,
        "currency" => currency
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        name: name,
        currency: currency
      }
    )
  end

  def new(nil), do: nil

  def new(map) do
    struct(__MODULE__, map)
  end
end
