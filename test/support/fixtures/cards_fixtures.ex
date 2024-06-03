defmodule Flashcards.CardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Flashcards.Cards` context.
  """

  @doc """
  Generate a card.
  """
  def card_fixture(attrs \\ %{}) do
    {:ok, card} =
      attrs
      |> Enum.into(%{
        side_a: "some side_a",
        side_b: "some side_b"
      })
      |> Flashcards.Cards.create_card()

    card
  end
end
