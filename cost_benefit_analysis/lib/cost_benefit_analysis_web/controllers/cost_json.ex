defmodule CostBenefitAnalysisWeb.CostJSON do
  alias CostBenefitAnalysis.Analysis.Cost

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
      amount: cost.amount
    }
  end
end
