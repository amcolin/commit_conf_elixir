defmodule PingPong do

  def start do
    ping_id = spawn(fn -> ping() end)
    pong_id = spawn(fn -> pong() end)
    send(pong_id, {ping_id, :ping})
    {ping_id, pong_id}
  end

  def pong do
    receive do
      {sender, :ping} ->
        IO.puts("ping")
        :timer.sleep(1_000)
        send(sender, {self(), :pong})
    end
    pong()
  end

  def ping do
    receive do
      {sender, :pong} ->
        IO.puts("pong")
        :timer.sleep(1_000)
        send(sender, {self(), :ping})
    end
    ping()
  end

end

pids = PingPong.start
IO.puts(inspect(pids))
:timer.sleep(300_000)
