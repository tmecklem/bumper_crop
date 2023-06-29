defmodule BumperCrop.FakeHarvestServer do
  @moduledoc """
  Fake (yet also real HTTP) server to handle requests that conform to
  Harvest's api and return responses that look like real Harvest responses.
  """

  use Plug.Router

  import BumperCrop.{
    FakeClientsApiHandler,
    FakeProjectsApiHandler,
    FakeTasksApiHandler,
    FakeTimeEntriesApiHandler,
    FakeTimeReportsApiHandler,
    FakeUsersApiHandler
  }

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/v2/clients" do
    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> handle_list_all_clients(conn.params)
  end

  get "/v2/projects" do
    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> handle_list_all_projects(conn.params)
  end

  get "/v2/reports/time/team" do
    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> handle_get_team_time_report(conn.params)
  end

  get "/v2/tasks" do
    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> handle_list_all_tasks(conn.params)
  end

  get "/v2/time_entries" do
    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> handle_list_all_time_entries(conn.params)
  end

  get "/v2/users" do
    conn
    |> put_resp_header("content-type", "application/json;charset=utf-8")
    |> handle_list_all_users(conn.params)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
