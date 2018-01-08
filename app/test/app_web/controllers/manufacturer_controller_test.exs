defmodule AppWeb.ManufacturerControllerTest do
  use AppWeb.ConnCase

  alias App.Product

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:manufacturer) do
    {:ok, manufacturer} = Product.create_manufacturer(@create_attrs)
    manufacturer
  end

  describe "index" do
    test "lists all manufacturers", %{conn: conn} do
      conn = get conn, manufacturer_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Manufacturers"
    end
  end

  describe "new manufacturer" do
    test "renders form", %{conn: conn} do
      conn = get conn, manufacturer_path(conn, :new)
      assert html_response(conn, 200) =~ "New Manufacturer"
    end
  end

  describe "create manufacturer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, manufacturer_path(conn, :create), manufacturer: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == manufacturer_path(conn, :show, id)

      conn = get conn, manufacturer_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Manufacturer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, manufacturer_path(conn, :create), manufacturer: @invalid_attrs
      assert html_response(conn, 200) =~ "New Manufacturer"
    end
  end

  describe "edit manufacturer" do
    setup [:create_manufacturer]

    test "renders form for editing chosen manufacturer", %{conn: conn, manufacturer: manufacturer} do
      conn = get conn, manufacturer_path(conn, :edit, manufacturer)
      assert html_response(conn, 200) =~ "Edit Manufacturer"
    end
  end

  describe "update manufacturer" do
    setup [:create_manufacturer]

    test "redirects when data is valid", %{conn: conn, manufacturer: manufacturer} do
      conn = put conn, manufacturer_path(conn, :update, manufacturer), manufacturer: @update_attrs
      assert redirected_to(conn) == manufacturer_path(conn, :show, manufacturer)

      conn = get conn, manufacturer_path(conn, :show, manufacturer)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, manufacturer: manufacturer} do
      conn = put conn, manufacturer_path(conn, :update, manufacturer), manufacturer: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Manufacturer"
    end
  end

  describe "delete manufacturer" do
    setup [:create_manufacturer]

    test "deletes chosen manufacturer", %{conn: conn, manufacturer: manufacturer} do
      conn = delete conn, manufacturer_path(conn, :delete, manufacturer)
      assert redirected_to(conn) == manufacturer_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, manufacturer_path(conn, :show, manufacturer)
      end
    end
  end

  defp create_manufacturer(_) do
    manufacturer = fixture(:manufacturer)
    {:ok, manufacturer: manufacturer}
  end
end
