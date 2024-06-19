defmodule CostBenefitAnalysis.Analysis.Cost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "costs" do
    field :amount, :float
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cost, attrs) do
    cost
    |> cast(attrs, [:description, :amount])
    |> validate_required([:description, :amount])
  end
end
