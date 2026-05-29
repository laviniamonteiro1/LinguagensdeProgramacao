defmodule Simulado.ContarOcorrencias do
  def contar_ocorrencias(_, []) do
    0
  end

  def contar_ocorrencias(elemento, [elemento | tail]) do
    1 + contar_ocorrencias(elemento, tail)
  end

  def contar_ocorrencias(elemento, [_head | tail]) do
    contar_ocorrencias(elemento, tail)
  end

  def contar_ocorrencias_tail(elemento, lista) do
    do_contar_ocorrencias_tail(elemento, lista, 0)
  end

  defp do_contar_ocorrencias_tail(_, [], aux) do
    aux
  end

  defp do_contar_ocorrencias_tail(elemento, [elemento | tail], aux) do
    do_contar_ocorrencias_tail(elemento, tail, aux + 1)
  end

  defp do_contar_ocorrencias_tail(elemento, [_head | tail], aux) do
    do_contar_ocorrencias_tail(elemento, tail, aux)
  end
end