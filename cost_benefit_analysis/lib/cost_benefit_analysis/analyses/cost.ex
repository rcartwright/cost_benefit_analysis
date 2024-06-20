defmodule CostBenefitAnalysis.Analyses.Cost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "costs" do
    field :description, :string
    field :weight, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cost, attrs) do
    cost
    |> cast(attrs, [:description, :weight])
    |> validate_required([:description, :weight])
  end
end
