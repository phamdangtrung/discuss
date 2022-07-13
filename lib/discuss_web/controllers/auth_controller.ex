defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.puts("### Connection Assigns")
    IO.inspect(conn.assigns)
    IO.puts("### Params")
    IO.inspect(params)
  end
end
