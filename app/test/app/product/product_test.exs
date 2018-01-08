defmodule App.ProductTest do
  use App.DataCase

  alias App.Product

  describe "categories" do
    alias App.Product.Category

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Product.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Product.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Product.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Product.create_category(@valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Product.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Product.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Product.update_category(category, @invalid_attrs)
      assert category == Product.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Product.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Product.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Product.change_category(category)
    end
  end

  describe "manufacturers" do
    alias App.Product.Manufacturer

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def manufacturer_fixture(attrs \\ %{}) do
      {:ok, manufacturer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Product.create_manufacturer()

      manufacturer
    end

    test "list_manufacturers/0 returns all manufacturers" do
      manufacturer = manufacturer_fixture()
      assert Product.list_manufacturers() == [manufacturer]
    end

    test "get_manufacturer!/1 returns the manufacturer with given id" do
      manufacturer = manufacturer_fixture()
      assert Product.get_manufacturer!(manufacturer.id) == manufacturer
    end

    test "create_manufacturer/1 with valid data creates a manufacturer" do
      assert {:ok, %Manufacturer{} = manufacturer} = Product.create_manufacturer(@valid_attrs)
      assert manufacturer.name == "some name"
    end

    test "create_manufacturer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Product.create_manufacturer(@invalid_attrs)
    end

    test "update_manufacturer/2 with valid data updates the manufacturer" do
      manufacturer = manufacturer_fixture()
      assert {:ok, manufacturer} = Product.update_manufacturer(manufacturer, @update_attrs)
      assert %Manufacturer{} = manufacturer
      assert manufacturer.name == "some updated name"
    end

    test "update_manufacturer/2 with invalid data returns error changeset" do
      manufacturer = manufacturer_fixture()
      assert {:error, %Ecto.Changeset{}} = Product.update_manufacturer(manufacturer, @invalid_attrs)
      assert manufacturer == Product.get_manufacturer!(manufacturer.id)
    end

    test "delete_manufacturer/1 deletes the manufacturer" do
      manufacturer = manufacturer_fixture()
      assert {:ok, %Manufacturer{}} = Product.delete_manufacturer(manufacturer)
      assert_raise Ecto.NoResultsError, fn -> Product.get_manufacturer!(manufacturer.id) end
    end

    test "change_manufacturer/1 returns a manufacturer changeset" do
      manufacturer = manufacturer_fixture()
      assert %Ecto.Changeset{} = Product.change_manufacturer(manufacturer)
    end
  end
end
