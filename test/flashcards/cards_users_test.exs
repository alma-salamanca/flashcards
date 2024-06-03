defmodule Flashcards.CardsUsersTest do
  use Flashcards.DataCase

  alias Flashcards.CardsUsers

  describe "card_user" do
    alias Flashcards.CardsUsers.CardUser

    import Flashcards.CardsUsersFixtures

    @invalid_attrs %{last_review: nil}

    test "list_card_user/0 returns all card_user" do
      card_user = card_user_fixture()
      assert CardsUsers.list_card_user() == [card_user]
    end

    test "get_card_user!/1 returns the card_user with given id" do
      card_user = card_user_fixture()
      assert CardsUsers.get_card_user!(card_user.id) == card_user
    end

    test "create_card_user/1 with valid data creates a card_user" do
      valid_attrs = %{last_review: ~N[2024-05-31 23:35:00]}

      assert {:ok, %CardUser{} = card_user} = CardsUsers.create_card_user(valid_attrs)
      assert card_user.last_review == ~N[2024-05-31 23:35:00]
    end

    test "create_card_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CardsUsers.create_card_user(@invalid_attrs)
    end

    test "update_card_user/2 with valid data updates the card_user" do
      card_user = card_user_fixture()
      update_attrs = %{last_review: ~N[2024-06-01 23:35:00]}

      assert {:ok, %CardUser{} = card_user} = CardsUsers.update_card_user(card_user, update_attrs)
      assert card_user.last_review == ~N[2024-06-01 23:35:00]
    end

    test "update_card_user/2 with invalid data returns error changeset" do
      card_user = card_user_fixture()
      assert {:error, %Ecto.Changeset{}} = CardsUsers.update_card_user(card_user, @invalid_attrs)
      assert card_user == CardsUsers.get_card_user!(card_user.id)
    end

    test "delete_card_user/1 deletes the card_user" do
      card_user = card_user_fixture()
      assert {:ok, %CardUser{}} = CardsUsers.delete_card_user(card_user)
      assert_raise Ecto.NoResultsError, fn -> CardsUsers.get_card_user!(card_user.id) end
    end

    test "change_card_user/1 returns a card_user changeset" do
      card_user = card_user_fixture()
      assert %Ecto.Changeset{} = CardsUsers.change_card_user(card_user)
    end
  end
end
