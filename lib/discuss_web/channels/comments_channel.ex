defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.Articles.Topic
  alias Discuss.Repo
  alias Discuss.Articles.Comments

  def join("comments:" <>  topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Topic
            |> Repo.get(topic_id)
            |> Repo.preload(comments: [:user])
    
    IO.inspect(socket)
    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, socket) do
    topic = socket.assigns.topic
    user_id = socket.assigns.user_id
    IO.puts("Start changeset")
    changeset = topic 
    |> Ecto.build_assoc(:comments, user_id: user_id)
    |> Comments.changeset(%{content: content})

    IO.inspect(changeset)
    
    case Repo.insert(changeset) do
      {:ok, comment} -> 
        broadcast!(socket, 
                  "comments:#{socket.assigns.topic.id}:new", 
                  %{comment: comment |> Repo.preload(:user)}
                  )
                  
        {:reply, :ok, socket}
      
      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
    
    {:reply, :ok, socket}
  end
end
