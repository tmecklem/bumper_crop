defmodule BumperCrop.Invoice do
  @moduledoc """
  This struct represents an Invoice in Harvest
  """

  use TypedStruct

  typedstruct do
    field(:id, integer())
    field(:client_key, String.t())
    field(:number, String.t())
    field(:purchase_order, String.t())
    field(:amount, float())
    field(:due_amount, float())
    field(:tax, float())
    field(:tax_amount, float())
    field(:tax2, float())
    field(:tax2_amount, float())
    field(:discount, float())
    field(:discount_amount, float())
    field(:subject, String.t())
    field(:notes, String.t())
    field(:state, String.t())
    field(:period_start, Date.t())
    field(:period_end, Date.t())
    field(:issue_date, Date.t())
    field(:due_date, Date.t())
    field(:payment_term, String.t())
    field(:sent_at, DateTime.t())
    field(:paid_at, DateTime.t())
    field(:paid_date, Date.t())
    field(:closed_at, DateTime.t())
    field(:recurring_invoice_id, integer())
    field(:created_at, DateTime.t())
    field(:updated_at, DateTime.t())
    field(:currency, String.t())
    field(:payment_options, list(String.t()))
    field(:client, map())
    field(:estimate, map())
    field(:retainer, map())
    field(:creator, map())
    field(:line_items, list(map()))
  end

  def new(%{
        "id" => id,
        "client_key" => client_key,
        "number" => number,
        "purchase_order" => purchase_order,
        "amount" => amount,
        "due_amount" => due_amount,
        "tax" => tax,
        "tax_amount" => tax_amount,
        "tax2" => tax2,
        "tax2_amount" => tax2_amount,
        "discount" => discount,
        "discount_amount" => discount_amount,
        "subject" => subject,
        "notes" => notes,
        "state" => state,
        "period_start" => period_start,
        "period_end" => period_end,
        "issue_date" => issue_date,
        "due_date" => due_date,
        "payment_term" => payment_term,
        "sent_at" => sent_at,
        "paid_at" => paid_at,
        "paid_date" => paid_date,
        "closed_at" => closed_at,
        "recurring_invoice_id" => recurring_invoice_id,
        "created_at" => created_at,
        "updated_at" => updated_at,
        "currency" => currency,
        "payment_options" => payment_options,
        "client" => client,
        "estimate" => estimate,
        "retainer" => retainer,
        "creator" => creator,
        "line_items" => line_items
      }) do
    struct(
      __MODULE__,
      %{
        id: id,
        client_key: client_key,
        number: number,
        purchase_order: purchase_order,
        amount: amount,
        due_amount: due_amount,
        tax: tax,
        tax_amount: tax_amount,
        tax2: tax2,
        tax2_amount: tax2_amount,
        discount: discount,
        discount_amount: discount_amount,
        subject: subject,
        notes: notes,
        state: state,
        period_start: parse_date(period_start),
        period_end: parse_date(period_end),
        issue_date: parse_date(issue_date),
        due_date: parse_date(due_date),
        payment_term: payment_term,
        sent_at: parse_datetime(sent_at),
        paid_at: parse_datetime(paid_at),
        paid_date: parse_date(paid_date),
        closed_at: parse_datetime(closed_at),
        recurring_invoice_id: recurring_invoice_id,
        created_at: parse_datetime(created_at),
        updated_at: parse_datetime(updated_at),
        currency: currency,
        payment_options: payment_options,
        client: client,
        estimate: estimate,
        retainer: retainer,
        creator: creator,
        line_items: line_items
      }
    )
  end

  def new(map) do
    struct(__MODULE__, map)
  end

  @datetime_format "{ISO:Extended:Z}"
  defp parse_datetime(nil), do: nil
  defp parse_datetime(date), do: Timex.parse!(date, @datetime_format)

  defp parse_date(nil), do: nil
  defp parse_date(date), do: Date.from_iso8601!(date)
end
