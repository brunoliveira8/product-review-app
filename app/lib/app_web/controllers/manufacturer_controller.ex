defmodule AppWeb.ManufacturerController do
  use AppWeb, :controller

  alias App.Product
  alias App.Product.Manufacturer

  def index(conn, _params) do
    manufacturers = Product.list_manufacturers()
    render(conn, "index.html", manufacturers: manufacturers)
  end

  def new(conn, _params) do
    changeset = Product.change_manufacturer(%Manufacturer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"manufacturer" => manufacturer_params}) do
    case Product.create_manufacturer(manufacturer_params) do
      {:ok, manufacturer} ->
        conn
        |> put_flash(:info, "Manufacturer created successfully.")
        |> redirect(to: manufacturer_path(conn, :show, manufacturer))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manufacturer = Product.get_manufacturer!(id)
    render(conn, "show.html", manufacturer: manufacturer)
  end

  def edit(conn, %{"id" => id}) do
    manufacturer = Product.get_manufacturer!(id)
    changeset = Product.change_manufacturer(manufacturer)
    render(conn, "edit.html", manufacturer: manufacturer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "manufacturer" => manufacturer_params}) do
    manufacturer = Product.get_manufacturer!(id)

    case Product.update_manufacturer(manufacturer, manufacturer_params) do
      {:ok, manufacturer} ->
        conn
        |> put_flash(:info, "Manufacturer updated successfully.")
        |> redirect(to: manufacturer_path(conn, :show, manufacturer))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", manufacturer: manufacturer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    manufacturer = Product.get_manufacturer!(id)
    {:ok, _manufacturer} = Product.delete_manufacturer(manufacturer)

    conn
    |> put_flash(:info, "Manufacturer deleted successfully.")
    |> redirect(to: manufacturer_path(conn, :index))
  end
end
