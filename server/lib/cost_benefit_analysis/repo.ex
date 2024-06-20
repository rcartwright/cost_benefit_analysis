defmodule CostBenefitAnalysis.Repo do
  use Ecto.Repo,
    otp_app: :cost_benefit_analysis,
    adapter: Ecto.Adapters.Postgres
end
