defmodule Flashcards.Boxes.Box do
  alias Flashcards.CardsUsers.CardUser
  use Ecto.Schema
  import Ecto.Changeset

  schema "boxes" do
    field :description, :string
    field :study_interval, :integer
    has_many :cards_users, CardUser

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(box, attrs) do
    box
    |> cast(attrs, [:description, :study_interval])
    |> validate_required([:description, :study_interval])
  end
end
