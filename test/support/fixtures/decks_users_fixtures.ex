defmodule Flashcards.DecksUsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Flashcards.DecksUsers` context.
  """

  @doc """
  Generate a deck_user.
  """
  def deck_user_fixture(attrs \\ %{}) do
    {:ok, deck_user} =
      attrs
      |> Enum.into(%{
        target: 42
      })
      |> Flashcards.DecksUsers.create_deck_user()

    deck_user
  end
end
