defmodule BumperCrop.TimeEntry.Project do
  @moduledoc """
  This struct represents a TimeEntry.Project in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:name, String.t())
    field(:code, String.t())
  end

  def new(%{
        "id" => id,
        "name" => name,
        "code" => code
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        name: name,
        code: code
      }
    )
  end

  def new(nil), do: nil

  def new(map) do
    struct(__MODULE__, map)
  end
end
