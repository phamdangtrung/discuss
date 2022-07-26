defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  alias Discuss.Accounts.User
  alias Discuss.Repo
  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    IO.puts("### Connection Assigns")
    IO.inspect(conn.assigns)
    IO.puts("### Params")
    IO.inspect(params)

    user_params = %{
                    token: auth.credentials.token,
                    email: auth.info.email,
                    provider: "github"
                    }
    changeset = User.changeset(%User{}, user_params)
    signin(conn, changeset)
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.topic_path(conn, :index))
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil -> 
        Repo.insert(changeset)
        
      user -> 
        {:ok, user}
    end
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.topic_path(conn, :index))
        
      {:error, _reason} ->
        conn
        |> put_flash(:error, "An error occurred!")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end
end
