defmodule Simulado.SomaQuadrados do
  def soma_quadrados(0) do
    0
  end

  def soma_quadrados(n) do
    (n * n) + soma_quadrados(n - 1)
  end

  def soma_quadrados_tail(n) do
    do_soma_quadrados_tail(n, 0)
  end

  defp do_soma_quadrados_tail(0, acc) do
    acc
  end

  defp do_soma_quadrados_tail(n, acc) do
    do_soma_quadrados_tail(n - 1, acc + (n * n))
  end
end