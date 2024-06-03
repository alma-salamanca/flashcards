defmodule Flashcards.DecksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Flashcards.Decks` context.
  """

  @doc """
  Generate a deck.
  """
  def deck_fixture(attrs \\ %{}) do
    {:ok, deck} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Flashcards.Decks.create_deck()

    deck
  end
end
