defmodule CostBenefitAnalysisWeb.BenefitControllerTest do
  use CostBenefitAnalysisWeb.ConnCase

  import CostBenefitAnalysis.AnalysesFixtures

  alias CostBenefitAnalysis.Analyses.Benefit

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
    test "lists all benefits", %{conn: conn} do
      conn = get(conn, ~p"/api/benefits")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create benefit" do
    test "renders benefit when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/benefits", benefit: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/benefits/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "weight" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/benefits", benefit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update benefit" do
    setup [:create_benefit]

    test "renders benefit when data is valid", %{conn: conn, benefit: %Benefit{id: id} = benefit} do
      conn = put(conn, ~p"/api/benefits/#{benefit}", benefit: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/benefits/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "weight" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, benefit: benefit} do
      conn = put(conn, ~p"/api/benefits/#{benefit}", benefit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete benefit" do
    setup [:create_benefit]

    test "deletes chosen benefit", %{conn: conn, benefit: benefit} do
      conn = delete(conn, ~p"/api/benefits/#{benefit}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/benefits/#{benefit}")
      end
    end
  end

  defp create_benefit(_) do
    benefit = benefit_fixture()
    %{benefit: benefit}
  end
end
