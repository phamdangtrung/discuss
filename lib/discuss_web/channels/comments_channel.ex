defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  def join(name, _params, socket) do
    IO.puts("### Name")
    IO.inspect(name)
    {:ok, %{hey: "fucking there"}, socket}
  end

  def handle_in() do

  end
end
