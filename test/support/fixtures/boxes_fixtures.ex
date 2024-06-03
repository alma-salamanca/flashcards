defmodule Flashcards.BoxesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Flashcards.Boxes` context.
  """

  @doc """
  Generate a box.
  """
  def box_fixture(attrs \\ %{}) do
    {:ok, box} =
      attrs
      |> Enum.into(%{
        description: "some description",
        study_interval: ~N[2024-05-31 23:34:00]
      })
      |> Flashcards.Boxes.create_box()

    box
  end
end
