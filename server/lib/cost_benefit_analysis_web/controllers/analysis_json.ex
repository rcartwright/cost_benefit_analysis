defmodule CostBenefitAnalysisWeb.AnalysisJSON do
  alias CostBenefitAnalysis.Analyses.Analysis

  @doc """
  Renders a list of analyses.
  """
  def index(%{analyses: analyses}) do
    %{data: for(analysis <- analyses, do: data(analysis))}
  end

  @doc """
  Renders a single analysis.
  """
  def show(%{analysis: analysis}) do
    %{data: data(analysis)}
  end

  defp data(%Analysis{} = analysis) do
    %{
      id: analysis.id,
      name: analysis.name,
      description: analysis.description,
      costs: Enum.map(analysis.costs, &cost_to_json/1),
      benefits: Enum.map(analysis.benefits, &benefit_to_json/1)
    }
  end


  defp cost_to_json(cost) do
    %{
      id: cost.id,
      weight: cost.weight,
      description: cost.description
    }
  end

  defp benefit_to_json(benefit) do
    %{
      id: benefit.id,
      weight: benefit.weight,
      description: benefit.description
    }
  end
end
