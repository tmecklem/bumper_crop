defmodule BumperCrop.TimeEntry.Task do
  @moduledoc """
  This struct represents a TimeEntry.Task in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:name, String.t())
  end

  def new(%{
        "id" => id,
        "name" => name
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        name: name
      }
    )
  end

  def new(nil), do: nil

  def new(map) do
    struct(__MODULE__, map)
  end
end
