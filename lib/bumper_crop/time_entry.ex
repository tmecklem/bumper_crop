defmodule BumperCrop.TimeEntry do
  @moduledoc """
  This struct represents a Time Entry in Harvest
  """

  alias BumperCrop.TimeEntry.{
    Client,
    Invoice,
    Project,
    Task,
    TaskAssignment,
    User,
    UserAssignment
  }

  use TypedStruct

  typedstruct do
    field(:billable, boolean())
    field(:billable_rate, Decimal.t())
    field(:budgeted, boolean())
    field(:client, Client.t())
    field(:cost_rate, Decimal.t())
    field(:created_at, DateTime.t())
    field(:ended_time, DateTime.t())
    field(:external_reference, String.t())
    field(:hours, Decimal.t())
    field(:hours_without_timer, Decimal.t())
    field(:id, integer())
    field(:invoice, Invoice.t())
    field(:is_billed, boolean())
    field(:is_closed, boolean())
    field(:is_locked, boolean())
    field(:is_running, boolean())
    field(:locked_reason, String.t())
    field(:notes, String.t())
    field(:project, Project.t())
    field(:rounded_hours, Decimal.t())
    field(:spent_date, Date.t())
    field(:started_time, DateTime.t())
    field(:task, Task.t())
    field(:task_assignment, TaskAssignment.t())
    field(:timer_started_at, DateTime.t())
    field(:updated_at, DateTime.t())
    field(:user, User.t())
    field(:user_assignment, UserAssignment.t())
  end

  def new(%{
        "billable" => billable,
        "billable_rate" => billable_rate,
        "budgeted" => budgeted,
        "client" => client,
        "cost_rate" => cost_rate,
        "created_at" => created_at,
        "ended_time" => ended_time,
        "external_reference" => external_reference,
        "hours" => hours,
        "hours_without_timer" => hours_without_timer,
        "id" => id,
        "invoice" => invoice,
        "is_billed" => is_billed,
        "is_closed" => is_closed,
        "is_locked" => is_locked,
        "is_running" => is_running,
        "locked_reason" => locked_reason,
        "notes" => notes,
        "project" => project,
        "rounded_hours" => rounded_hours,
        "spent_date" => spent_date,
        "started_time" => started_time,
        "task" => task,
        "task_assignment" => task_assignment,
        "timer_started_at" => timer_started_at,
        "updated_at" => updated_at,
        "user" => user,
        "user_assignment" => user_assignment
      }) do
    struct(
      __MODULE__,
      %{
        billable: billable,
        billable_rate: from_float(billable_rate),
        budgeted: budgeted,
        client: Client.new(client),
        cost_rate: from_float(cost_rate),
        created_at: parse_datetime(created_at),
        ended_time: parse_datetime(ended_time),
        external_reference: external_reference,
        hours: from_float(hours),
        hours_without_timer: from_float(hours_without_timer),
        id: id,
        invoice: Invoice.new(invoice),
        is_billed: is_billed,
        is_closed: is_closed,
        is_locked: is_locked,
        is_running: is_running,
        locked_reason: locked_reason,
        notes: notes,
        project: Project.new(project),
        rounded_hours: from_float(rounded_hours),
        spent_date: parse_date(spent_date),
        started_time: parse_datetime(started_time),
        task: Task.new(task),
        task_assignment: TaskAssignment.new(task_assignment),
        timer_started_at: parse_datetime(timer_started_at),
        updated_at: parse_datetime(updated_at),
        user: User.new(user),
        user_assignment: UserAssignment.new(user_assignment)
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
