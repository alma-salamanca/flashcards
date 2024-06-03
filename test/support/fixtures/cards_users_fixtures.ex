defmodule Flashcards.CardsUsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Flashcards.CardsUsers` context.
  """

  @doc """
  Generate a card_user.
  """
  def card_user_fixture(attrs \\ %{}) do
    {:ok, card_user} =
      attrs
      |> Enum.into(%{
        last_review: ~N[2024-05-31 23:35:00]
      })
      |> Flashcards.CardsUsers.create_card_user()

    card_user
  end
end
