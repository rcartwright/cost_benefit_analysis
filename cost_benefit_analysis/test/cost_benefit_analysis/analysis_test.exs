defmodule CostBenefitAnalysis.AnalysisTest do
  use CostBenefitAnalysis.DataCase

  alias CostBenefitAnalysis.Analysis

  describe "costs" do
    alias CostBenefitAnalysis.Analysis.Cost

    import CostBenefitAnalysis.AnalysisFixtures

    @invalid_attrs %{amount: nil, description: nil}

    test "list_costs/0 returns all costs" do
      cost = cost_fixture()
      assert Analysis.list_costs() == [cost]
    end

    test "get_cost!/1 returns the cost with given id" do
      cost = cost_fixture()
      assert Analysis.get_cost!(cost.id) == cost
    end

    test "create_cost/1 with valid data creates a cost" do
      valid_attrs = %{amount: 120.5, description: "some description"}

      assert {:ok, %Cost{} = cost} = Analysis.create_cost(valid_attrs)
      assert cost.amount == 120.5
      assert cost.description == "some description"
    end

    test "create_cost/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analysis.create_cost(@invalid_attrs)
    end

    test "update_cost/2 with valid data updates the cost" do
      cost = cost_fixture()
      update_attrs = %{amount: 456.7, description: "some updated description"}

      assert {:ok, %Cost{} = cost} = Analysis.update_cost(cost, update_attrs)
      assert cost.amount == 456.7
      assert cost.description == "some updated description"
    end

    test "update_cost/2 with invalid data returns error changeset" do
      cost = cost_fixture()
      assert {:error, %Ecto.Changeset{}} = Analysis.update_cost(cost, @invalid_attrs)
      assert cost == Analysis.get_cost!(cost.id)
    end

    test "delete_cost/1 deletes the cost" do
      cost = cost_fixture()
      assert {:ok, %Cost{}} = Analysis.delete_cost(cost)
      assert_raise Ecto.NoResultsError, fn -> Analysis.get_cost!(cost.id) end
    end

    test "change_cost/1 returns a cost changeset" do
      cost = cost_fixture()
      assert %Ecto.Changeset{} = Analysis.change_cost(cost)
    end
  end
end
