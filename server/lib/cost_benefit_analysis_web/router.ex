defmodule CostBenefitAnalysisWeb.Router do
  use CostBenefitAnalysisWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CostBenefitAnalysisWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CostBenefitAnalysisWeb do
    # pipe_through :browser

    pipe_through :api

    get "/", PageController, :ping
  end

  # Other scopes may use custom stacks.
  scope "/api", CostBenefitAnalysisWeb do
    pipe_through :api

    get "/", PageController, :ping

    resources "/costs", CostController, except: [:new, :edit]
    resources "/benefits", BenefitController, except: [:new, :edit]
    resources "/analyses", AnalysisController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:cost_benefit_analysis, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CostBenefitAnalysisWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
