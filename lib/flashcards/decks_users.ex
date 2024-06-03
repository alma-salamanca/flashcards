defmodule Flashcards.DecksUsers do
  @moduledoc """
  The DecksUsers context.
  """

  import Ecto.Query, warn: false
  alias Flashcards.Repo

  alias Flashcards.DecksUsers.DeckUser

  @doc """
  Returns the list of decks_users.

  ## Examples

      iex> list_decks_users()
      [%DeckUser{}, ...]

  """
  def list_decks_users do
    Repo.all(DeckUser)
  end

  @doc """
  Gets a single deck_user.

  Raises `Ecto.NoResultsError` if the Deck user does not exist.

  ## Examples

      iex> get_deck_user!(123)
      %DeckUser{}

      iex> get_deck_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deck_user!(id), do: Repo.get!(DeckUser, id)

  @doc """
  Creates a deck_user.

  ## Examples

      iex> create_deck_user(%{field: value})
      {:ok, %DeckUser{}}

      iex> create_deck_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deck_user(deck_user \\ %DeckUser{}) do
    #TODO search alternative
    Ecto.Multi.new()
    |> Ecto.Multi.insert(:deck_user, deck_user)
    |> Repo.transaction()
  end

  @doc """
  Updates a deck_user.

  ## Examples

      iex> update_deck_user(deck_user, %{field: new_value})
      {:ok, %DeckUser{}}

      iex> update_deck_user(deck_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deck_user(%DeckUser{} = deck_user, attrs) do
    deck_user
    |> DeckUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a deck_user.

  ## Examples

      iex> delete_deck_user(deck_user)
      {:ok, %DeckUser{}}

      iex> delete_deck_user(deck_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deck_user(%DeckUser{} = deck_user) do
    Repo.delete(deck_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deck_user changes.

  ## Examples

      iex> change_deck_user(deck_user)
      %Ecto.Changeset{data: %DeckUser{}}

  """
  def change_deck_user(%DeckUser{} = deck_user, attrs \\ %{}) do
    DeckUser.changeset(deck_user, attrs)
  end
end
