defmodule CostBenefitAnalysisWeb.BenefitJSON do
  alias CostBenefitAnalysis.Analyses.Benefit


  @doc """
  Renders a list of benefits.
  """
  def index(%{benefits: benefits}) do
    %{data: for(benefit <- benefits, do: data(benefit))}
  end

  @doc """
  Renders a single benefit.
  """
  def show(%{benefit: benefit}) do
    %{data: data(benefit)}
  end

  defp data(%Benefit{} = benefit) do
    %{
      id: benefit.id,
      description: benefit.description,
      weight: benefit.weight
    }
  end
end
