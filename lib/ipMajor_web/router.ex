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
  pipeline :ensure_auth do
    plug IpMajorWeb.Auth.Redirect

  end

  scope "/", IpMajorWeb do
    pipe_through [:browser]

    live "/", LoginLive.Index, :index

    live "/register", RegisterLive.Index, :index



  end
  scope "/admin", IpMajorWeb do
    pipe_through [:browser,:ensure_auth]
      live "/", CourseLive.Index, :index
      live "/courses/overzicht", CourseLive.Overzicht, :overzicht
      live "/courses/overzicht", CourseLive.Overzicht, :getCourse

      live "/courses/new", CourseLive.Index, :new
      live "/courses/:id/edit", CourseLive.Index, :edit

      live "/courses/:id", CourseLive.Show, :show
      live "/courses/:id/register", CourseLive.Register, :register
      live "/courses/:id/show/edit", CourseLive.Show, :edit

      live "/users", UserLive.Index
      live "/users/:id", UserLive.Show
      live "/users/:id/edit", UserLive.Edit
      live "/users/new", UserLive.New

      live "/reservations/create", ReservationLive.Create, :new

      live "/reservations", ReservationLive.Index, :index

      live "/reservations/new", ReservationLive.Index, :new
      live "/reservations/:id/edit", ReservationLive.Index, :edit

      live "/reservations/:id", ReservationLive.Show, :show
      live "/reservations/:id/show/edit", ReservationLive.Show, :edit

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
