defmodule CostBenefitAnalysisWeb.BenefitController do
  use CostBenefitAnalysisWeb, :controller

  alias CostBenefitAnalysis.Analyses
  alias CostBenefitAnalysis.Analyses.Benefit

  action_fallback CostBenefitAnalysisWeb.FallbackController

  def index(conn, _params) do
    benefits = Analyses.list_benefits()
    render(conn, :index, benefits: benefits)
  end

  def create(conn, %{"benefit" => benefit_params}) do
    with {:ok, %Benefit{} = benefit} <- Analyses.create_benefit(benefit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/benefits/#{benefit}")
      |> render(:show, benefit: benefit)
    end
  end

  def show(conn, %{"id" => id}) do
    benefit = Analyses.get_benefit!(id)
    render(conn, :show, benefit: benefit)
  end

  def update(conn, %{"id" => id, "benefit" => benefit_params}) do
    benefit = Analyses.get_benefit!(id)

    with {:ok, %Benefit{} = benefit} <- Analyses.update_benefit(benefit, benefit_params) do
      render(conn, :show, benefit: benefit)
    end
  end

  def delete(conn, %{"id" => id}) do
    benefit = Analyses.get_benefit!(id)

    with {:ok, %Benefit{}} <- Analyses.delete_benefit(benefit) do
      send_resp(conn, :no_content, "")
    end
  end
end
