defmodule CostBenefitAnalysis.Repo.Migrations.CreateAnalyses do
  use Ecto.Migration

  def change do
    create table(:analyses) do
      add :name, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
