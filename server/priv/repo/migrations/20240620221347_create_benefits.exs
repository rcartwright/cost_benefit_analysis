defmodule CostBenefitAnalysis.Repo.Migrations.CreateBenefits do
  use Ecto.Migration

  def change do
    create table(:benefits) do
      add :description, :string
      add :weight, :float

      timestamps(type: :utc_datetime)
    end
  end
end
