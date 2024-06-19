defmodule CostBenefitAnalysis.AnalysisFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CostBenefitAnalysis.Analysis` context.
  """

  @doc """
  Generate a cost.
  """
  def cost_fixture(attrs \\ %{}) do
    {:ok, cost} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        description: "some description"
      })
      |> CostBenefitAnalysis.Analysis.create_cost()

    cost
  end
end
