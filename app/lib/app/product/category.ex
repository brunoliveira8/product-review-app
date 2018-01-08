defmodule App.Product.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.Product.Category


  schema "categories" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
