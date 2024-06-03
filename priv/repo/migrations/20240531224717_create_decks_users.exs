defmodule Flashcards.Repo.Migrations.CreateDecksUsers do
  use Ecto.Migration

  def change do
    create table(:decks_users) do
      add :target, :integer
      add(:deck_id, references(:decks, on_delete: :delete_all))
      add(:user_id, references(:users, on_delete: :delete_all))

      timestamps(type: :utc_datetime)
    end
  end
end
