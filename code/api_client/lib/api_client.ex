defmodule ApiClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://localhost:4000/api"
  plug Tesla.Middleware.JSON

  def get_sum(value) do
    post("/sum", %{input: value}, headers: [{"content-type", "application/json"}])
  end
end
