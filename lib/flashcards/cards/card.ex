defmodule Flashcards.Cards.Card do
  use Ecto.Schema
  alias Flashcards.CardsUsers.CardUser
  import Ecto.Changeset

  schema "cards" do
    field :side_a, :string
    field :side_b, :string
    belongs_to :deck, Flashcards.Decks.Deck
    has_many :cards_users, CardUser
    has_many :users, through: [:cards_users, :user]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:side_a, :side_b, :deck_id])
    |> validate_required([:side_a, :side_b, :deck_id])
  end
end
