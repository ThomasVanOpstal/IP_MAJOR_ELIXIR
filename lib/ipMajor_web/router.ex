defmodule IpMajorWeb.Router do
  use IpMajorWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {IpMajorWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IpMajorWeb do
    pipe_through :browser

    #live "/users", UserLive.Index
    #live "/users/:id", UserLive.Show
    #live "/users/:id/edit", UserLive.Edit
    #live "/users/new", UserLive.New

    #live "/profiles", ProfileLive.Index, :index
    #live "/profiles/new", ProfileLive.Index, :new
    #live "/profiles/:id/edit", ProfileLive.Index, :edit

    #live "/profiles/:id", ProfileLive.Show, :show
    #live "/profiles/:id/show/edit", ProfileLive.Show, :edit

    live "/reservations/create", ReservationLive.Create, :new

    live "/reservations", ReservationLive.Index, :index

    live "/reservations/new", ReservationLive.Index, :new
    live "/reservations/:id/edit", ReservationLive.Index, :edit

    live "/reservations/:id", ReservationLive.Show, :show
    live "/reservations/:id/show/edit", ReservationLive.Show, :edit

    #live "/trainers", TrainerLive.Index, :index
    #live "/trainers/new", TrainerLive.Index, :new
    #live "/trainers/:id/edit", TrainerLive.Index, :edit

    #live "/trainers/:id", TrainerLive.Show, :show
    #live "/trainers/:id/show/edit", TrainerLive.Show, :edit

    #live "/payments", PaymentLive.Index, :index
    #live "/payments/new", PaymentLive.Index, :new
    #live "/payments/:id/edit", PaymentLive.Index, :edit

    #live "/payments/:id", PaymentLive.Show, :show
    #live "/payments/:id/show/edit", PaymentLive.Show, :edit

    #live "/locations", LocationLive.Index, :index
    #live "/locations/new", LocationLive.Index, :new
    #live "/locations/:id/edit", LocationLive.Index, :edit

    #live "/locations/:id", LocationLive.Show, :show
    #live "/locations/:id/show/edit", LocationLive.Show, :edit

    live "/", CourseLive.Index, :index
    live "/courses/overzicht", CourseLive.Overzicht, :overzicht

    live "/courses/new", CourseLive.Index, :new
    live "/courses/:id/edit", CourseLive.Index, :edit

    live "/courses/:id", CourseLive.Show, :show
    live "/courses/:id/register", CourseLive.Register, :register
    live "/courses/:id/show/edit", CourseLive.Show, :edit

    #live "/categorys", CategoryLive.Index, :index
    #live "/categorys/new", CategoryLive.Index, :new
    #live "/categorys/:id/edit", CategoryLive.Index, :edit

    #live "/categorys/:id", CategoryLive.Show, :show
    #live "/categorys/:id/show/edit", CategoryLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", IpMajorWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: IpMajorWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
