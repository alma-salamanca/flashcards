defmodule Flashcards.Repo.Migrations.CreateBoxes do
  use Ecto.Migration

  def change do
    create table(:boxes) do
      add :description, :string
      add :study_interval, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
