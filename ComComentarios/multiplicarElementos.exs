defmodule Simulado.MultiplicarElementos do
  
  # ==========================================
  # RECURSÃO SEM CAUDA (A Pilha Cresce)
  # ==========================================
  
  # Caso base: O elemento neutro da multiplicação é 1. 
  # Se a lista esvaziar, retorna 1 para não zerar a conta.
  def multiplicar_elementos([]) do
    1
  end

  # O VILÃO DA MEMÓRIA:
  # A função tira o primeiro item da lista (head) e prepara para multiplicar (*).
  # Mas ela é OBRIGADA a pausar e esperar o resto da lista (tail) ser calculado primeiro.
  def multiplicar_elementos([head | tail]) do
    head * multiplicar_elementos(tail)
  end


  # ==========================================
  # RECURSÃO COM CAUDA (Otimizada)
  # ==========================================
  
  # Porta de entrada: O usuário só manda a lista. 
  # A função chama o "motor" interno e inicia a variável auxiliar (aux) com 1.
  def multiplicar_elementos_tail(lista) do
    do_multiplicar_elementos_tail(lista, 1)
  end

  # Caso base: A lista esvaziou. A corrida de revezamento acabou.
  # Simplesmente devolvemos o valor total que foi sendo guardado dentro do "aux".
  defp do_multiplicar_elementos_tail([], aux) do
    aux
  end

  # O motor: A MÁGICA ACONTECE AQUI.
  # Em vez de esperar, a função tira o primeiro número (head) e já multiplica
  # ele pelo "aux" DENTRO dos parênteses. O resultado já vai pronto para a próxima rodada!
  defp do_multiplicar_elementos_tail([head | tail], aux) do
    do_multiplicar_elementos_tail(tail, aux * head)
  end

end