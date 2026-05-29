defmodule Simulado.MultiplicarElementos do
  def multiplicar_elementos([]) do
    1
  end

  def multiplicar_elementos([head | tail]) do
    head * multiplicar_elementos(tail)
  end

  def multiplicar_elementos_tail(lista) do
    do_multiplicar_elementos_tail(lista, 1)
  end

  defp do_multiplicar_elementos_tail([], aux) do
    aux
  end

  defp do_multiplicar_elementos_tail([head | tail], aux) do
    do_multiplicar_elementos_tail(tail, aux * head)
  end
end