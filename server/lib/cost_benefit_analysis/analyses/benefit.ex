defmodule CostBenefitAnalysis.Analyses.Benefit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "benefits" do
    field :description, :string
    field :weight, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(benefit, attrs) do
    benefit
    |> cast(attrs, [:description, :weight])
    |> validate_required([:description, :weight])
  end
end
