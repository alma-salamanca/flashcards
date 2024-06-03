defmodule Flashcards.DecksUsers.DeckUser do
  use Ecto.Schema
  import Ecto.Changeset
  alias Flashcards.Decks.Deck
  alias Flashcards.Accounts.User

  schema "decks_users" do
    field :target, :integer
    belongs_to :user, User
    belongs_to :deck, Deck

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(deck_user, attrs) do
    deck_user
    |> cast(attrs, [:target, :deck_id, :user_id])
    |> validate_required([:target])
  end

end
