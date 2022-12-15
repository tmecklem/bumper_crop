defmodule BumperCrop.TimeEntry.Invoice do
  @moduledoc """
  This struct represents a TimeEntry.Invoice in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:number, String.t())
  end

  def new(%{
        "id" => id,
        "number" => number
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        number: number
      }
    )
  end

  def new(nil), do: nil

  def new(map) do
    struct(__MODULE__, map)
  end
end
