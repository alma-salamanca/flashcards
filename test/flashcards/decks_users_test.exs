defmodule Flashcards.DecksUsersTest do
  use Flashcards.DataCase

  alias Flashcards.DecksUsers

  describe "decks_users" do
    alias Flashcards.DecksUsers.DeckUser

    import Flashcards.DecksUsersFixtures

    @invalid_attrs %{target: nil}

    test "list_decks_users/0 returns all decks_users" do
      deck_user = deck_user_fixture()
      assert DecksUsers.list_decks_users() == [deck_user]
    end

    test "get_deck_user!/1 returns the deck_user with given id" do
      deck_user = deck_user_fixture()
      assert DecksUsers.get_deck_user!(deck_user.id) == deck_user
    end

    test "create_deck_user/1 with valid data creates a deck_user" do
      valid_attrs = %{target: 42}

      assert {:ok, %DeckUser{} = deck_user} = DecksUsers.create_deck_user(valid_attrs)
      assert deck_user.target == 42
    end

    test "create_deck_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DecksUsers.create_deck_user(@invalid_attrs)
    end

    test "update_deck_user/2 with valid data updates the deck_user" do
      deck_user = deck_user_fixture()
      update_attrs = %{target: 43}

      assert {:ok, %DeckUser{} = deck_user} = DecksUsers.update_deck_user(deck_user, update_attrs)
      assert deck_user.target == 43
    end

    test "update_deck_user/2 with invalid data returns error changeset" do
      deck_user = deck_user_fixture()
      assert {:error, %Ecto.Changeset{}} = DecksUsers.update_deck_user(deck_user, @invalid_attrs)
      assert deck_user == DecksUsers.get_deck_user!(deck_user.id)
    end

    test "delete_deck_user/1 deletes the deck_user" do
      deck_user = deck_user_fixture()
      assert {:ok, %DeckUser{}} = DecksUsers.delete_deck_user(deck_user)
      assert_raise Ecto.NoResultsError, fn -> DecksUsers.get_deck_user!(deck_user.id) end
    end

    test "change_deck_user/1 returns a deck_user changeset" do
      deck_user = deck_user_fixture()
      assert %Ecto.Changeset{} = DecksUsers.change_deck_user(deck_user)
    end
  end
end
