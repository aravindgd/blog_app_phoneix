defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack
    resources "/blogs",  BlogController
    get "/", PageController, :index
  end



  # Other scopes may use custom stacks.
  # scope "/api", Blog do
    #   pipe_through :api
    # end
end
