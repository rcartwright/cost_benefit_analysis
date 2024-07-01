defmodule CostBenefitAnalysis.Analyses.Analysis do
  use Ecto.Schema
  import Ecto.Changeset


  schema "analyses" do
    field :description, :string
    field :name, :string
    has_many :costs, CostBenefitAnalysis.Analyses.Cost
    has_many :benefits, CostBenefitAnalysis.Analyses.Benefit

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(analysis, attrs) do
    analysis
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
