defmodule CostBenefitAnalysisWeb.AnalysisController do
  use CostBenefitAnalysisWeb, :controller

  alias CostBenefitAnalysis.Analyses
  alias CostBenefitAnalysis.Analyses.Analysis

  action_fallback CostBenefitAnalysisWeb.FallbackController

  def index(conn, _params) do
    analyses = Analyses.list_analyses()
    render(conn, :index, analyses: analyses)
  end

  def create(conn, %{"analysis" => analysis_params}) do
    with {:ok, %Analysis{} = analysis} <- Analyses.create_analysis(analysis_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/analyses/#{analysis}")
      |> render(:show, analysis: analysis)
    end
  end

  def show(conn, %{"id" => id}) do
    analysis = Analyses.get_analysis!(id)
    render(conn, :show, analysis: analysis)
  end

  def update(conn, %{"id" => id, "analysis" => analysis_params}) do
    analysis = Analyses.get_analysis!(id)

    with {:ok, %Analysis{} = analysis} <- Analyses.update_analysis(analysis, analysis_params) do
      render(conn, :show, analysis: analysis)
    end
  end

  def delete(conn, %{"id" => id}) do
    analysis = Analyses.get_analysis!(id)

    with {:ok, %Analysis{}} <- Analyses.delete_analysis(analysis) do
      send_resp(conn, :no_content, "")
    end
  end
end
