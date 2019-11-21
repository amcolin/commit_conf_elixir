defmodule ApiClient do
  use Tesla
  require Logger

  plug Tesla.Middleware.BaseUrl, "http://localhost:4000/api"
  plug Tesla.Middleware.JSON

  def start do
    0..10
    |> Enum.map(fn number ->
      spawn(fn -> get_sum(number) end)
    end)
  end

  def get_sum(number) do
    value = 9..14
    |> Enum.take_random(1)
    |> List.first

    # Logger.info("Conexión #{number}: Pidiendo sumatoria de #{value}")
      start_time = DateTime.to_unix(DateTime.utc_now, :millisecond)
      {:ok, response} = post("/sum", %{input: value}, headers: [{"content-type", "application/json"}])
      end_time = DateTime.to_unix(DateTime.utc_now, :millisecond)
      time = end_time - start_time
      result = case response.body do
        %{"result" => result} -> "#{result}"
        %{"error" => error} -> error
      end
    Logger.info("Conexión #{number}: #{time}ms Sumatoria de #{value} Respuesta del servidor: #{result}")
    # Logger.info("Conexión #{number}: Sumatoria de #{value} Respuesta del servidor: #{result}")
    Process.sleep(1000)
    get_sum(number)
  end

end
