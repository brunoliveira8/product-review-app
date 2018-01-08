defmodule App.Product.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.Product.Item


  schema "product_items" do
    field :description, :string
    field :name, :string
    field :image_url, :string
    field :category_id, :id
    field :manufacturer_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description, :image_url])
    |> validate_required([:name, :description])
  end
end
