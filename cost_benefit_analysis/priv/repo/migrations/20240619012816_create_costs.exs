defmodule CostBenefitAnalysis.Repo.Migrations.CreateCosts do
  use Ecto.Migration

  def change do
    create table(:costs) do
      add :description, :string
      add :amount, :float

      timestamps(type: :utc_datetime)
    end
  end
end
