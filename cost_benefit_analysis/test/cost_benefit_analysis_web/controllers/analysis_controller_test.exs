defmodule CostBenefitAnalysisWeb.AnalysisControllerTest do
  use CostBenefitAnalysisWeb.ConnCase

  import CostBenefitAnalysis.AnalysesFixtures

  alias CostBenefitAnalysis.Analyses.Analysis

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all analyses", %{conn: conn} do
      conn = get(conn, ~p"/api/analyses")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create analysis" do
    test "renders analysis when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/analyses", analysis: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/analyses/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/analyses", analysis: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update analysis" do
    setup [:create_analysis]

    test "renders analysis when data is valid", %{conn: conn, analysis: %Analysis{id: id} = analysis} do
      conn = put(conn, ~p"/api/analyses/#{analysis}", analysis: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/analyses/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, analysis: analysis} do
      conn = put(conn, ~p"/api/analyses/#{analysis}", analysis: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete analysis" do
    setup [:create_analysis]

    test "deletes chosen analysis", %{conn: conn, analysis: analysis} do
      conn = delete(conn, ~p"/api/analyses/#{analysis}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/analyses/#{analysis}")
      end
    end
  end

  defp create_analysis(_) do
    analysis = analysis_fixture()
    %{analysis: analysis}
  end
end
