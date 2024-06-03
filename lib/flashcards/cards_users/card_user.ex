defmodule Flashcards.CardsUsers.CardUser do
  alias Flashcards.Accounts.User
  alias Flashcards.Cards.Card
  alias Flashcards.Boxes.Box
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards_users" do
    field :last_review, :naive_datetime
    belongs_to :user, User
    belongs_to :card, Card
    belongs_to :box, Box
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(card_user, attrs) do
    card_user
    |> cast(attrs, [:last_review])
    |> validate_required([:last_review])
  end
end
