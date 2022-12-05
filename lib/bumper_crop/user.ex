defmodule BumperCrop.User do
  @moduledoc """
  This struct represents a User in Harvest user resource calls
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:first_name, String.t())
    field(:last_name, String.t())
    field(:email, String.t())
    field(:telephone, String.t())
    field(:timezone, String.t())
    field(:has_access_to_all_future_projects, boolean())
    field(:is_contractor, boolean())
    field(:is_active, boolean())
    field(:weekly_capacity, integer())
    field(:default_hourly_rate, Decimal.t())
    field(:cost_rate, Decimal.t())
    field(:roles, list(String.t()))
    field(:access_roles, list(String.t()))
    field(:avatar_url, String.t())
    field(:created_at, DateTime.t())
    field(:updated_at, DateTime.t())
  end

  def new(%{
        "id" => id,
        "first_name" => first_name,
        "last_name" => last_name,
        "email" => email,
        "telephone" => telephone,
        "timezone" => timezone,
        "has_access_to_all_future_projects" => has_access_to_all_future_projects,
        "is_contractor" => is_contractor,
        "is_active" => is_active,
        "weekly_capacity" => weekly_capacity,
        "default_hourly_rate" => default_hourly_rate,
        "cost_rate" => cost_rate,
        "roles" => roles,
        "access_roles" => access_roles,
        "avatar_url" => avatar_url,
        "created_at" => created_at,
        "updated_at" => updated_at
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        first_name: first_name,
        last_name: last_name,
        email: email,
        telephone: telephone,
        timezone: timezone,
        has_access_to_all_future_projects: has_access_to_all_future_projects,
        is_contractor: is_contractor,
        is_active: is_active,
        weekly_capacity: weekly_capacity,
        default_hourly_rate: from_float(default_hourly_rate),
        cost_rate: from_float(cost_rate),
        roles: roles,
        access_roles: access_roles,
        avatar_url: avatar_url,
        created_at: parse_datetime(created_at),
        updated_at: parse_datetime(updated_at)
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
