defmodule CostBenefitAnalysisWeb.CostJSON do
  alias CostBenefitAnalysis.Analyses.Cost

  @doc """
  Renders a list of costs.
  """
  def index(%{costs: costs}) do
    %{data: for(cost <- costs, do: data(cost))}
  end

  @doc """
  Renders a single cost.
  """
  def show(%{cost: cost}) do
    %{data: data(cost)}
  end

  defp data(%Cost{} = cost) do
    %{
      id: cost.id,
      description: cost.description,
      weight: cost.weight
    }
  end
end
