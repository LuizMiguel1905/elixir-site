defmodule AlexandriaWeb.HomeController do

  use AlexandriaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
