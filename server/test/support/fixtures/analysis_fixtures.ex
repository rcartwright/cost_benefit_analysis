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

  @doc """
  Generate a benefit.
  """
  def benefit_fixture(attrs \\ %{}) do
    {:ok, benefit} =
      attrs
      |> Enum.into(%{
        description: "some description",
        weight: 120.5
      })
      |> CostBenefitAnalysis.Analysis.create_benefit()

    benefit
  end
end
