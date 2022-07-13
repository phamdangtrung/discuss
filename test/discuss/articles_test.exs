defmodule Discuss.ArticlesTest do
  use Discuss.DataCase

  alias Discuss.Articles

  describe "topics" do
    alias Discuss.Articles.Topic

    import Discuss.ArticlesFixtures

    @invalid_attrs %{title: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Articles.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Articles.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Topic{} = topic} = Articles.create_topic(valid_attrs)
      assert topic.title == "some title"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Topic{} = topic} = Articles.update_topic(topic, update_attrs)
      assert topic.title == "some updated title"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_topic(topic, @invalid_attrs)
      assert topic == Articles.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Articles.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Articles.change_topic(topic)
    end
  end

  describe "comments" do
    alias Discuss.Articles.Comments

    import Discuss.ArticlesFixtures

    @invalid_attrs %{}

    test "list_comments/0 returns all comments" do
      comments = comments_fixture()
      assert Articles.list_comments() == [comments]
    end

    test "get_comments!/1 returns the comments with given id" do
      comments = comments_fixture()
      assert Articles.get_comments!(comments.id) == comments
    end

    test "create_comments/1 with valid data creates a comments" do
      valid_attrs = %{}

      assert {:ok, %Comments{} = comments} = Articles.create_comments(valid_attrs)
    end

    test "create_comments/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Articles.create_comments(@invalid_attrs)
    end

    test "update_comments/2 with valid data updates the comments" do
      comments = comments_fixture()
      update_attrs = %{}

      assert {:ok, %Comments{} = comments} = Articles.update_comments(comments, update_attrs)
    end

    test "update_comments/2 with invalid data returns error changeset" do
      comments = comments_fixture()
      assert {:error, %Ecto.Changeset{}} = Articles.update_comments(comments, @invalid_attrs)
      assert comments == Articles.get_comments!(comments.id)
    end

    test "delete_comments/1 deletes the comments" do
      comments = comments_fixture()
      assert {:ok, %Comments{}} = Articles.delete_comments(comments)
      assert_raise Ecto.NoResultsError, fn -> Articles.get_comments!(comments.id) end
    end

    test "change_comments/1 returns a comments changeset" do
      comments = comments_fixture()
      assert %Ecto.Changeset{} = Articles.change_comments(comments)
    end
  end
end
