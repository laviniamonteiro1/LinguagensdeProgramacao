defmodule Simulado do
  # Recursão sem Cauda
  def fibonacci(1) do
    1
  end
  def fibonacci(2) do
    1
  end
  def fibonacci(n) when n > 2 do
    fibonacci(n - 1) + fibonacci(n - 2)
  end

  # Recursão com Cauda
  def fibonacci_tail(n) do
    do_fibonacci_tail(n, 0, 1)
  end

  # Agora sim: quando n chegar em 1, devolvemos a resposta que foi acumulada em 'b'
  defp do_fibonacci_tail(1, _a, b) do
    b
  end

  # O passo que faz o cálculo
  defp do_fibonacci_tail(n, a, b) do
    do_fibonacci_tail(n - 1, b, a + b)
  end
end