# Recursão sem Cauda
defmodule Simulado do
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
  defp do_fibonacci_tail(1, _ , _) do
    1
  end
  defp do_fibonacci_tail(2, _ , _) do
    1
  end
  defp do_fibonacci_tail(n, a, b) do
    do_fibonacci_tail(n - 1, b, a + b)
  end
end