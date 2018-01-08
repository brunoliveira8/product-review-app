defmodule App.Product.Manufacturer do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.Product.Manufacturer


  schema "manufacturers" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Manufacturer{} = manufacturer, attrs) do
    manufacturer
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
