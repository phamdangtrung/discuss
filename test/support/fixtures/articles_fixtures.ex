defmodule Discuss.ArticlesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.Articles` context.
  """

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Discuss.Articles.create_topic()

    topic
  end

  @doc """
  Generate a comments.
  """
  def comments_fixture(attrs \\ %{}) do
    {:ok, comments} =
      attrs
      |> Enum.into(%{

      })
      |> Discuss.Articles.create_comments()

    comments
  end
end
