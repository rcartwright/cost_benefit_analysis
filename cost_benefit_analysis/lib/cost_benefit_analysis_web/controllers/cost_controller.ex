defmodule CostBenefitAnalysisWeb.CostController do
  use CostBenefitAnalysisWeb, :controller

  alias CostBenefitAnalysis.Analysis
  alias CostBenefitAnalysis.Analysis.Cost

  action_fallback CostBenefitAnalysisWeb.FallbackController

  def index(conn, _params) do
    costs = Analysis.list_costs()
    render(conn, :index, costs: costs)
  end

  def create(conn, %{"cost" => cost_params}) do
    with {:ok, %Cost{} = cost} <- Analysis.create_cost(cost_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/costs/#{cost}")
      |> render(:show, cost: cost)
    end
  end

  def show(conn, %{"id" => id}) do
    cost = Analysis.get_cost!(id)
    render(conn, :show, cost: cost)
  end

  def update(conn, %{"id" => id, "cost" => cost_params}) do
    cost = Analysis.get_cost!(id)

    with {:ok, %Cost{} = cost} <- Analysis.update_cost(cost, cost_params) do
      render(conn, :show, cost: cost)
    end
  end

  def delete(conn, %{"id" => id}) do
    cost = Analysis.get_cost!(id)

    with {:ok, %Cost{}} <- Analysis.delete_cost(cost) do
      send_resp(conn, :no_content, "")
    end
  end
end
