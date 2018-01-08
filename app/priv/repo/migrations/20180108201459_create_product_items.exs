defmodule App.Repo.Migrations.CreateProductItems do
  use Ecto.Migration

  def change do
    create table(:product_items) do
      add :name, :string
      add :description, :text
      add :category_id, references(:categories, on_delete: :nothing)
      add :manufacturer_id, references(:manufacturers, on_delete: :nothing)

      timestamps()
    end

    create index(:product_items, [:category_id])
    create index(:product_items, [:manufacturer_id])
  end
end
