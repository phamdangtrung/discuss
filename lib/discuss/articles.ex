defmodule Discuss.Articles do
  @moduledoc """
  The Articles context.
  """

  import Ecto.Query, warn: false
  alias Discuss.Repo

  alias Discuss.Articles.Topic

  @doc """
  Returns the list of topics.

  ## Examples

      iex> list_topics()
      [%Topic{}, ...]

  """
  def list_topics do
    Repo.all(Topic)
  end

  @doc """
  Gets a single topic.

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123)
      %Topic{}

      iex> get_topic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topic!(id), do: Repo.get!(Topic, id)

  @doc """
  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value})
      {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a topic.

  ## Examples

      iex> update_topic(topic, %{field: new_value})
      {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a topic.

  ## Examples

      iex> delete_topic(topic)
      {:ok, %Topic{}}

      iex> delete_topic(topic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topic changes.

  ## Examples

      iex> change_topic(topic)
      %Ecto.Changeset{data: %Topic{}}

  """
  def change_topic(%Topic{} = topic, attrs \\ %{}) do
    Topic.changeset(topic, attrs)
  end

  alias Discuss.Articles.Comments

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comments{}, ...]

  """
  def list_comments do
    Repo.all(Comments)
  end

  @doc """
  Gets a single comments.

  Raises `Ecto.NoResultsError` if the Comments does not exist.

  ## Examples

      iex> get_comments!(123)
      %Comments{}

      iex> get_comments!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comments!(id), do: Repo.get!(Comments, id)

  @doc """
  Creates a comments.

  ## Examples

      iex> create_comments(%{field: value})
      {:ok, %Comments{}}

      iex> create_comments(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comments(attrs \\ %{}) do
    %Comments{}
    |> Comments.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comments.

  ## Examples

      iex> update_comments(comments, %{field: new_value})
      {:ok, %Comments{}}

      iex> update_comments(comments, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comments(%Comments{} = comments, attrs) do
    comments
    |> Comments.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a comments.

  ## Examples

      iex> delete_comments(comments)
      {:ok, %Comments{}}

      iex> delete_comments(comments)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comments(%Comments{} = comments) do
    Repo.delete(comments)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comments changes.

  ## Examples

      iex> change_comments(comments)
      %Ecto.Changeset{data: %Comments{}}

  """
  def change_comments(%Comments{} = comments, attrs \\ %{}) do
    Comments.changeset(comments, attrs)
  end
end
