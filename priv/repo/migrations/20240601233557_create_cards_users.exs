defmodule Flashcards.Repo.Migrations.CreateCardUser do
  use Ecto.Migration

  def change do
    create table(:cards_users) do
      add :last_review, :naive_datetime
      add(:card_id, references(:cards, on_delete: :delete_all))
      add(:user_id, references(:users, on_delete: :delete_all))
      add(:box_id, references(:boxes, on_delete: :delete_all))

      timestamps(type: :utc_datetime)
    end
  end
end
