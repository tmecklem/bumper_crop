defmodule BumperCrop.Project do
  @moduledoc """
  This struct represents a Project in Harvest
  """

  use TypedStruct

  alias BumperCrop.ProjectClient

  typedstruct do
    field(:id, integer())
    field(:name, String.t())
    field(:code, String.t())
    field(:is_active, boolean())
    field(:is_billable, boolean())
    field(:is_fixed_fee, boolean())
    field(:bill_by, String.t())
    field(:budget, Decimal.t())
    field(:budget_by, String.t())
    field(:budget_is_monthly, boolean())
    field(:notify_when_over_budget, boolean())
    field(:over_budget_notification_percentage, Decimal.t())
    field(:show_budget_to_all, boolean())
    field(:created_at, DateTime.t())
    field(:updated_at, DateTime.t())
    field(:starts_on, Date.t())
    field(:ends_on, Date.t())
    field(:over_budget_notification_date, Date.t())
    field(:notes, String.t())
    field(:cost_budget, Decimal.t())
    field(:cost_budget_include_expenses, boolean())
    field(:hourly_rate, Decimal.t())
    field(:fee, Decimal.t())
    field(:client, ProjectClient.t())
  end

  def new(%{
        "id" => id,
        "name" => name,
        "code" => code,
        "is_active" => is_active,
        "is_billable" => is_billable,
        "is_fixed_fee" => is_fixed_fee,
        "bill_by" => bill_by,
        "budget" => budget,
        "budget_by" => budget_by,
        "budget_is_monthly" => budget_is_monthly,
        "notify_when_over_budget" => notify_when_over_budget,
        "over_budget_notification_percentage" => over_budget_notification_percentage,
        "show_budget_to_all" => show_budget_to_all,
        "created_at" => created_at,
        "updated_at" => updated_at,
        "starts_on" => starts_on,
        "ends_on" => ends_on,
        "over_budget_notification_date" => over_budget_notification_date,
        "notes" => notes,
        "cost_budget" => cost_budget,
        "cost_budget_include_expenses" => cost_budget_include_expenses,
        "hourly_rate" => hourly_rate,
        "fee" => fee,
        "client" => client
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        name: name,
        code: code,
        is_active: is_active,
        is_billable: is_billable,
        is_fixed_fee: is_fixed_fee,
        bill_by: bill_by,
        budget: from_float(budget),
        budget_by: budget_by,
        budget_is_monthly: budget_is_monthly,
        notify_when_over_budget: notify_when_over_budget,
        over_budget_notification_percentage: from_float(over_budget_notification_percentage),
        show_budget_to_all: show_budget_to_all,
        created_at: parse_datetime(created_at),
        updated_at_at: parse_datetime(updated_at),
        starts_on: parse_date(starts_on),
        ends_on: parse_date(ends_on),
        over_budget_notification_date: parse_date(over_budget_notification_date),
        notes: notes,
        cost_budget: from_float(cost_budget),
        cost_budget_include_expenses: cost_budget_include_expenses,
        hourly_rate: from_float(hourly_rate),
        fee: from_float(fee),
        client: ProjectClient.new(client)
      }
    )
  end

  def new(map) do
    struct(__MODULE__, map)
  end

  defp from_float(nil), do: nil
  defp from_float(float), do: Decimal.from_float(float)

  @date_format "%Y-%m-%d"
  defp parse_date(nil), do: nil
  defp parse_date(date), do: Timex.to_date(Timex.parse!(date, @date_format, :strftime))

  @datetime_format "{ISO:Extended:Z}"
  defp parse_datetime(nil), do: nil
  defp parse_datetime(date), do: Timex.parse!(date, @datetime_format)
end
