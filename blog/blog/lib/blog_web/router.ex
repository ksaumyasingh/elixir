defmodule BlogWeb.Router do
  use BlogWeb, :router
  # simply makes Phoenix router functions available in our particular router.
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BlogWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BlogWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  # /s/
  scope "/", BlogWeb do
    pipe_through :browser
    # pipelines allow a set of plugs to be applied to different sets of routes.

    get "/", PageController, :index
    # get is a Phoenix macro that corresponds to the HTTP verb GET.
    #  Similar macros exist for other HTTP verbs, including POST, PUT, PATCH, DELETE, OPTIONS, CONNECT, TRACE, and HEAD.
    # The router supports other macros besides those for HTTP verbs like get, post, and put. The most important among them is resources.

    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    # resource with all func
    resources "/users", UserController
    # resource with only two func
    resources "/posts", PostController, only: [:index, :show]
    # resource with all func except delete
    resources "/comments", CommentController, except: [:delete]
    resources "/reviews", ReviewController
    # nested resource
    resources "/client", UserController do
      resources "/order", PostController
    end
  end
  # Interestingly, we can use multiple scopes with the same path as long as we are careful not to duplicate routes.
  scope "/", AnotherAppWeb do
    pipe_through :browser

    resources "/app", AppController
  end

  scope "/admin", HelloWeb.Admin, as: :admin do
    pipe_through :browser

    resources "/review", ReviewController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogWeb do
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

      live_dashboard "/dashboard", metrics: BlogWeb.Telemetry
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
