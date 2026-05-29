defmodule Simulado.SomaQuadrados do
  
  # ==========================================
  # RECURSÃO SEM CAUDA (A Pilha Cresce)
  # ==========================================
  def soma_quadrados(0) do
    0
  end

  def soma_quadrados(n) do
    # O VILÃO DA MEMÓRIA ESTÁ AQUI:
    # A função calcula o quadrado (n*n) e fica ESPERANDO a próxima função terminar para poder somar (+).
    (n * n) + soma_quadrados(n - 1)
  end


  # ==========================================
  # RECURSÃO COM CAUDA (Otimizada)
  # ==========================================
  def soma_quadrados_tail(n) do
    do_soma_quadrados_tail(n, 0)
  end

  # Caso Base: n chegou a 0, devolvemos o que foi acumulado
  defp do_soma_quadrados_tail(0, acc) do
    acc
  end

  defp do_soma_quadrados_tail(n, acc) do
    # A MÁGICA ESTÁ AQUI:
    # A soma "acc + (n * n)" acontece DENTRO dos parênteses. 
    # O resultado já vai pronto para o próximo passo. Ninguém fica esperando.
    do_soma_quadrados_tail(n - 1, acc + (n * n))
  end

end