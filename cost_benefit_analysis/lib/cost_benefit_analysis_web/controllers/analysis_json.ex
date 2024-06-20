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
      description: analysis.description
    }
  end
end
