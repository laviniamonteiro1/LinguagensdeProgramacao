defmodule Simulado.Intersecao do
  def intersecao([], _conjunto_b) do
    []
  end

  def intersecao([head | tail], conjunto_b) do
    if head in conjunto_b do
      [head | intersecao(tail, conjunto_b)]
    else
      intersecao(tail, conjunto_b)
    end
  end

  def intersecao_tail(conjunto_a, conjunto_b) do
    do_intersecao_tail(conjunto_a, conjunto_b, [])
  end

  defp do_intersecao_tail([], _conjunto_b, aux) do
    Enum.reverse(aux)
  end

  defp do_intersecao_tail([head | tail], conjunto_b, aux) do
    if head in conjunto_b do
      do_intersecao_tail(tail, conjunto_b, [head | aux])
    else
      do_intersecao_tail(tail, conjunto_b, aux)
    end
  end
end