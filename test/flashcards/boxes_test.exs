defmodule Flashcards.BoxesTest do
  use Flashcards.DataCase

  alias Flashcards.Boxes

  describe "boxes" do
    alias Flashcards.Boxes.Box

    import Flashcards.BoxesFixtures

    @invalid_attrs %{description: nil, study_interval: nil}

    test "list_boxes/0 returns all boxes" do
      box = box_fixture()
      assert Boxes.list_boxes() == [box]
    end

    test "get_box!/1 returns the box with given id" do
      box = box_fixture()
      assert Boxes.get_box!(box.id) == box
    end

    test "create_box/1 with valid data creates a box" do
      valid_attrs = %{description: "some description", study_interval: ~N[2024-05-31 23:34:00]}

      assert {:ok, %Box{} = box} = Boxes.create_box(valid_attrs)
      assert box.description == "some description"
      assert box.study_interval == ~N[2024-05-31 23:34:00]
    end

    test "create_box/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boxes.create_box(@invalid_attrs)
    end

    test "update_box/2 with valid data updates the box" do
      box = box_fixture()
      update_attrs = %{description: "some updated description", study_interval: ~N[2024-06-01 23:34:00]}

      assert {:ok, %Box{} = box} = Boxes.update_box(box, update_attrs)
      assert box.description == "some updated description"
      assert box.study_interval == ~N[2024-06-01 23:34:00]
    end

    test "update_box/2 with invalid data returns error changeset" do
      box = box_fixture()
      assert {:error, %Ecto.Changeset{}} = Boxes.update_box(box, @invalid_attrs)
      assert box == Boxes.get_box!(box.id)
    end

    test "delete_box/1 deletes the box" do
      box = box_fixture()
      assert {:ok, %Box{}} = Boxes.delete_box(box)
      assert_raise Ecto.NoResultsError, fn -> Boxes.get_box!(box.id) end
    end

    test "change_box/1 returns a box changeset" do
      box = box_fixture()
      assert %Ecto.Changeset{} = Boxes.change_box(box)
    end
  end
end
