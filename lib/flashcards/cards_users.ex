defmodule Flashcards.CardsUsers do
  @moduledoc """
  The CardsUsers context.
  """

  import Ecto.Query, warn: false
  alias Flashcards.Repo

  alias Flashcards.CardsUsers.CardUser

  @doc """
  Returns the list of card_user.

  ## Examples

      iex> list_card_user()
      [%CardUser{}, ...]

  """
  def list_card_user do
    Repo.all(CardUser)
  end

  @doc """
  Gets a single card_user.

  Raises `Ecto.NoResultsError` if the Card user does not exist.

  ## Examples

      iex> get_card_user!(123)
      %CardUser{}

      iex> get_card_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_card_user!(id), do: Repo.get!(CardUser, id)

  @doc """
  Creates a card_user.

  ## Examples

      iex> create_card_user(%{field: value})
      {:ok, %CardUser{}}

      iex> create_card_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_card_user(card_user \\ %CardUser{}) do
    #is this the right approach to insert into a join table with extra fields?
    Ecto.Multi.new()
    |> Ecto.Multi.insert(:card_user, card_user)
    |> Repo.transaction()
  end

  @doc """
  Updates a card_user.

  ## Examples

      iex> update_card_user(card_user, %{field: new_value})
      {:ok, %CardUser{}}

      iex> update_card_user(card_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_card_user(%CardUser{} = card_user, attrs) do
    card_user
    |> CardUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a card_user.

  ## Examples

      iex> delete_card_user(card_user)
      {:ok, %CardUser{}}

      iex> delete_card_user(card_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_card_user(%CardUser{} = card_user) do
    Repo.delete(card_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card_user changes.

  ## Examples

      iex> change_card_user(card_user)
      %Ecto.Changeset{data: %CardUser{}}

  """
  def change_card_user(%CardUser{} = card_user, attrs \\ %{}) do
    CardUser.changeset(card_user, attrs)
  end
end
