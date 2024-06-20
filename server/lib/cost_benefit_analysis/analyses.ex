defmodule CostBenefitAnalysis.Analyses do
  @moduledoc """
  The Analyses context.
  """

  import Ecto.Query, warn: false
  alias CostBenefitAnalysis.Repo

  alias CostBenefitAnalysis.Analyses.Analysis

  @doc """
  Returns the list of analyses.

  ## Examples

      iex> list_analyses()
      [%Analysis{}, ...]

  """
  def list_analyses do
    Repo.all(Analysis)
  end

  @doc """
  Gets a single analysis.

  Raises `Ecto.NoResultsError` if the Analysis does not exist.

  ## Examples

      iex> get_analysis!(123)
      %Analysis{}

      iex> get_analysis!(456)
      ** (Ecto.NoResultsError)

  """
  def get_analysis!(id), do: Repo.get!(Analysis, id)

  @doc """
  Creates a analysis.

  ## Examples

      iex> create_analysis(%{field: value})
      {:ok, %Analysis{}}

      iex> create_analysis(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_analysis(attrs \\ %{}) do
    %Analysis{}
    |> Analysis.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a analysis.

  ## Examples

      iex> update_analysis(analysis, %{field: new_value})
      {:ok, %Analysis{}}

      iex> update_analysis(analysis, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_analysis(%Analysis{} = analysis, attrs) do
    analysis
    |> Analysis.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a analysis.

  ## Examples

      iex> delete_analysis(analysis)
      {:ok, %Analysis{}}

      iex> delete_analysis(analysis)
      {:error, %Ecto.Changeset{}}

  """
  def delete_analysis(%Analysis{} = analysis) do
    Repo.delete(analysis)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking analysis changes.

  ## Examples

      iex> change_analysis(analysis)
      %Ecto.Changeset{data: %Analysis{}}

  """
  def change_analysis(%Analysis{} = analysis, attrs \\ %{}) do
    Analysis.changeset(analysis, attrs)
  end

  alias CostBenefitAnalysis.Analyses.Benefit

  @doc """
  Returns the list of benefits.

  ## Examples

      iex> list_benefits()
      [%Benefit{}, ...]

  """
  def list_benefits do
    Repo.all(Benefit)
  end

  @doc """
  Gets a single benefit.

  Raises `Ecto.NoResultsError` if the Benefit does not exist.

  ## Examples

      iex> get_benefit!(123)
      %Benefit{}

      iex> get_benefit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_benefit!(id), do: Repo.get!(Benefit, id)

  @doc """
  Creates a benefit.

  ## Examples

      iex> create_benefit(%{field: value})
      {:ok, %Benefit{}}

      iex> create_benefit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_benefit(attrs \\ %{}) do
    %Benefit{}
    |> Benefit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a benefit.

  ## Examples

      iex> update_benefit(benefit, %{field: new_value})
      {:ok, %Benefit{}}

      iex> update_benefit(benefit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_benefit(%Benefit{} = benefit, attrs) do
    benefit
    |> Benefit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a benefit.

  ## Examples

      iex> delete_benefit(benefit)
      {:ok, %Benefit{}}

      iex> delete_benefit(benefit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_benefit(%Benefit{} = benefit) do
    Repo.delete(benefit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking benefit changes.

  ## Examples

      iex> change_benefit(benefit)
      %Ecto.Changeset{data: %Benefit{}}

  """
  def change_benefit(%Benefit{} = benefit, attrs \\ %{}) do
    Benefit.changeset(benefit, attrs)
  end

  alias CostBenefitAnalysis.Analyses.Cost

  @doc """
  Returns the list of costs.

  ## Examples

      iex> list_costs()
      [%Cost{}, ...]

  """
  def list_costs do
    Repo.all(Cost)
  end

  @doc """
  Gets a single cost.

  Raises `Ecto.NoResultsError` if the Cost does not exist.

  ## Examples

      iex> get_cost!(123)
      %Cost{}

      iex> get_cost!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cost!(id), do: Repo.get!(Cost, id)

  @doc """
  Creates a cost.

  ## Examples

      iex> create_cost(%{field: value})
      {:ok, %Cost{}}

      iex> create_cost(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cost(attrs \\ %{}) do
    %Cost{}
    |> Cost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cost.

  ## Examples

      iex> update_cost(cost, %{field: new_value})
      {:ok, %Cost{}}

      iex> update_cost(cost, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cost(%Cost{} = cost, attrs) do
    cost
    |> Cost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cost.

  ## Examples

      iex> delete_cost(cost)
      {:ok, %Cost{}}

      iex> delete_cost(cost)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cost(%Cost{} = cost) do
    Repo.delete(cost)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cost changes.

  ## Examples

      iex> change_cost(cost)
      %Ecto.Changeset{data: %Cost{}}

  """
  def change_cost(%Cost{} = cost, attrs \\ %{}) do
    Cost.changeset(cost, attrs)
  end
end
