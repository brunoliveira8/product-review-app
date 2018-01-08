defmodule App.Repo.Migrations.AddUrlToProductItem do
  use Ecto.Migration

  def change do
    alter table(:product_items) do
      add :image_url, :string
    end
  end
end
