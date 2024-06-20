defmodule CostBenefitAnalysisWeb.CostControllerTest do
  use CostBenefitAnalysisWeb.ConnCase

  import CostBenefitAnalysis.AnalysesFixtures

  alias CostBenefitAnalysis.Analyses.Cost

  @create_attrs %{
    description: "some description",
    weight: 120.5
  }
  @update_attrs %{
    description: "some updated description",
    weight: 456.7
  }
  @invalid_attrs %{description: nil, weight: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all costs", %{conn: conn} do
      conn = get(conn, ~p"/api/costs")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cost" do
    test "renders cost when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/costs", cost: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/costs/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "weight" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/costs", cost: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cost" do
    setup [:create_cost]

    test "renders cost when data is valid", %{conn: conn, cost: %Cost{id: id} = cost} do
      conn = put(conn, ~p"/api/costs/#{cost}", cost: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/costs/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "weight" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cost: cost} do
      conn = put(conn, ~p"/api/costs/#{cost}", cost: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cost" do
    setup [:create_cost]

    test "deletes chosen cost", %{conn: conn, cost: cost} do
      conn = delete(conn, ~p"/api/costs/#{cost}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/costs/#{cost}")
      end
    end
  end

  defp create_cost(_) do
    cost = cost_fixture()
    %{cost: cost}
  end
end
