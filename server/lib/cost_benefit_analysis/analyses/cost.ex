defmodule CostBenefitAnalysis.Analyses.Cost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "costs" do
    field :description, :string
    field :weight, :float

    belongs_to :analysis, CostBenefitAnalysis.Analyses.Analysis

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cost, attrs) do
    cost
    |> cast(attrs, [:description, :weight, :analysis_id])
    |> validate_required([:description, :weight])
  end
end
