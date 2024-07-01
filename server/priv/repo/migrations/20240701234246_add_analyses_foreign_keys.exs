defmodule CostBenefitAnalysis.Repo.Migrations.AddAnalysesForeignKeys do
  use Ecto.Migration

  def change do
    alter table(:costs) do
      add :analysis_id, references(:analyses, on_delete: :delete_all), null: false
    end

    alter table(:benefits) do
      add :analysis_id, references(:analyses, on_delete: :delete_all), null: false
    end
  end
end
