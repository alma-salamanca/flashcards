defmodule Flashcards.Decks.Deck do
  use Ecto.Schema
  import Ecto.Changeset
  alias Flashcards.DecksUsers.DeckUser

  schema "decks" do
    field :description, :string
    has_many :cards, Flashcards.Cards.Card
    has_many :decks_users, DeckUser
    has_many :users, through: [:decks_users, :user]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(deck, attrs) do
    deck
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end

end
