defmodule Procesos do
  def secuencial do
    imprime_numeros(10)
    imprime_numeros_reverso(10)
  end

  def imprime_numeros(limite) do
    Enum.each(0..limite, fn x ->
      IO.puts(x)
    end)
  end

  def imprime_numeros_reverso(limite) do
    Enum.each(limite..0, fn x ->
      IO.puts(x)
    end)
  end
end
