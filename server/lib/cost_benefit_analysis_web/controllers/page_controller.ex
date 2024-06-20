defmodule CostBenefitAnalysisWeb.PageController do
  use CostBenefitAnalysisWeb, :controller

  def ping(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :ping)
  end
end
