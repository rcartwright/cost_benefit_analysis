defmodule CostBenefitAnalysis.AnalysesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CostBenefitAnalysis.Analyses` context.
  """

  @doc """
  Generate a analysis.
  """
  def analysis_fixture(attrs \\ %{}) do
    {:ok, analysis} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> CostBenefitAnalysis.Analyses.create_analysis()

    analysis
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
      |> CostBenefitAnalysis.Analyses.create_benefit()

    benefit
  end

  @doc """
  Generate a cost.
  """
  def cost_fixture(attrs \\ %{}) do
    {:ok, cost} =
      attrs
      |> Enum.into(%{
        description: "some description",
        weight: 120.5
      })
      |> CostBenefitAnalysis.Analyses.create_cost()

    cost
  end
end
