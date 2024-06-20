defmodule CostBenefitAnalysis.AnalysesTest do
  use CostBenefitAnalysis.DataCase

  alias CostBenefitAnalysis.Analyses

  describe "analyses" do
    alias CostBenefitAnalysis.Analyses.Analysis

    import CostBenefitAnalysis.AnalysesFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_analyses/0 returns all analyses" do
      analysis = analysis_fixture()
      assert Analyses.list_analyses() == [analysis]
    end

    test "get_analysis!/1 returns the analysis with given id" do
      analysis = analysis_fixture()
      assert Analyses.get_analysis!(analysis.id) == analysis
    end

    test "create_analysis/1 with valid data creates a analysis" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Analysis{} = analysis} = Analyses.create_analysis(valid_attrs)
      assert analysis.description == "some description"
      assert analysis.name == "some name"
    end

    test "create_analysis/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analyses.create_analysis(@invalid_attrs)
    end

    test "update_analysis/2 with valid data updates the analysis" do
      analysis = analysis_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Analysis{} = analysis} = Analyses.update_analysis(analysis, update_attrs)
      assert analysis.description == "some updated description"
      assert analysis.name == "some updated name"
    end

    test "update_analysis/2 with invalid data returns error changeset" do
      analysis = analysis_fixture()
      assert {:error, %Ecto.Changeset{}} = Analyses.update_analysis(analysis, @invalid_attrs)
      assert analysis == Analyses.get_analysis!(analysis.id)
    end

    test "delete_analysis/1 deletes the analysis" do
      analysis = analysis_fixture()
      assert {:ok, %Analysis{}} = Analyses.delete_analysis(analysis)
      assert_raise Ecto.NoResultsError, fn -> Analyses.get_analysis!(analysis.id) end
    end

    test "change_analysis/1 returns a analysis changeset" do
      analysis = analysis_fixture()
      assert %Ecto.Changeset{} = Analyses.change_analysis(analysis)
    end
  end

  describe "benefits" do
    alias CostBenefitAnalysis.Analyses.Benefit

    import CostBenefitAnalysis.AnalysesFixtures

    @invalid_attrs %{description: nil, weight: nil}

    test "list_benefits/0 returns all benefits" do
      benefit = benefit_fixture()
      assert Analyses.list_benefits() == [benefit]
    end

    test "get_benefit!/1 returns the benefit with given id" do
      benefit = benefit_fixture()
      assert Analyses.get_benefit!(benefit.id) == benefit
    end

    test "create_benefit/1 with valid data creates a benefit" do
      valid_attrs = %{description: "some description", weight: 120.5}

      assert {:ok, %Benefit{} = benefit} = Analyses.create_benefit(valid_attrs)
      assert benefit.description == "some description"
      assert benefit.weight == 120.5
    end

    test "create_benefit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analyses.create_benefit(@invalid_attrs)
    end

    test "update_benefit/2 with valid data updates the benefit" do
      benefit = benefit_fixture()
      update_attrs = %{description: "some updated description", weight: 456.7}

      assert {:ok, %Benefit{} = benefit} = Analyses.update_benefit(benefit, update_attrs)
      assert benefit.description == "some updated description"
      assert benefit.weight == 456.7
    end

    test "update_benefit/2 with invalid data returns error changeset" do
      benefit = benefit_fixture()
      assert {:error, %Ecto.Changeset{}} = Analyses.update_benefit(benefit, @invalid_attrs)
      assert benefit == Analyses.get_benefit!(benefit.id)
    end

    test "delete_benefit/1 deletes the benefit" do
      benefit = benefit_fixture()
      assert {:ok, %Benefit{}} = Analyses.delete_benefit(benefit)
      assert_raise Ecto.NoResultsError, fn -> Analyses.get_benefit!(benefit.id) end
    end

    test "change_benefit/1 returns a benefit changeset" do
      benefit = benefit_fixture()
      assert %Ecto.Changeset{} = Analyses.change_benefit(benefit)
    end
  end

  describe "costs" do
    alias CostBenefitAnalysis.Analyses.Cost

    import CostBenefitAnalysis.AnalysesFixtures

    @invalid_attrs %{description: nil, weight: nil}

    test "list_costs/0 returns all costs" do
      cost = cost_fixture()
      assert Analyses.list_costs() == [cost]
    end

    test "get_cost!/1 returns the cost with given id" do
      cost = cost_fixture()
      assert Analyses.get_cost!(cost.id) == cost
    end

    test "create_cost/1 with valid data creates a cost" do
      valid_attrs = %{description: "some description", weight: 120.5}

      assert {:ok, %Cost{} = cost} = Analyses.create_cost(valid_attrs)
      assert cost.description == "some description"
      assert cost.weight == 120.5
    end

    test "create_cost/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Analyses.create_cost(@invalid_attrs)
    end

    test "update_cost/2 with valid data updates the cost" do
      cost = cost_fixture()
      update_attrs = %{description: "some updated description", weight: 456.7}

      assert {:ok, %Cost{} = cost} = Analyses.update_cost(cost, update_attrs)
      assert cost.description == "some updated description"
      assert cost.weight == 456.7
    end

    test "update_cost/2 with invalid data returns error changeset" do
      cost = cost_fixture()
      assert {:error, %Ecto.Changeset{}} = Analyses.update_cost(cost, @invalid_attrs)
      assert cost == Analyses.get_cost!(cost.id)
    end

    test "delete_cost/1 deletes the cost" do
      cost = cost_fixture()
      assert {:ok, %Cost{}} = Analyses.delete_cost(cost)
      assert_raise Ecto.NoResultsError, fn -> Analyses.get_cost!(cost.id) end
    end

    test "change_cost/1 returns a cost changeset" do
      cost = cost_fixture()
      assert %Ecto.Changeset{} = Analyses.change_cost(cost)
    end
  end
end
