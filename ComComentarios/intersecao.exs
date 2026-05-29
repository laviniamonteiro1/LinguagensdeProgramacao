defmodule Simulado.Intersecao do

  # ==========================================
  # RECURSÃO SEM CAUDA (A Pilha Cresce)
  # ==========================================
  
  # Caso base: Se o primeiro conjunto estiver vazio, não tem como haver itens em comum. 
  # Retorna uma lista vazia.
  def intersecao([], _conjunto_b) do
    []
  end

  def intersecao([head | tail], conjunto_b) do
    # Verifica se o item atual (head) do conjunto A existe dentro do conjunto B
    if head in conjunto_b do
      # O VILÃO DA MEMÓRIA:
      # Achou um item em comum! Mas para montar a lista final, o computador pega 
      # esse "head" e FICA ESPERANDO o resto da lista (tail) ser processada.
      [head | intersecao(tail, conjunto_b)]
    else
      # Se não achou, simplesmente ignora o item e passa para o resto da lista.
      intersecao(tail, conjunto_b)
    end
  end


  # ==========================================
  # RECURSÃO COM CAUDA (Otimizada)
  # ==========================================
  
  # Porta de entrada: O usuário manda os dois conjuntos.
  # Iniciamos o nosso acumulador auxiliar (aux) como uma lista vazia [].
  def intersecao_tail(conjunto_a, conjunto_b) do
    do_intersecao_tail(conjunto_a, conjunto_b, [])
  end

  # Caso base: O primeiro conjunto esvaziou. Acabou a corrida.
  defp do_intersecao_tail([], _conjunto_b, aux) do
    # Como fomos colocando os itens no "aux" um em cima do outro, 
    # eles ficam de trás para frente. Usamos o reverse só para arrumar a ordem final!
    Enum.reverse(aux)
  end

  defp do_intersecao_tail([head | tail], conjunto_b, aux) do
    if head in conjunto_b do
      # A MÁGICA:
      # Achou um item em comum! Em vez de esperar, a função já joga esse item
      # para dentro do "aux" ([head | aux]) imediatamente e passa a lista pronta 
      # para o próximo passo. Memória liberada!
      do_intersecao_tail(tail, conjunto_b, [head | aux])
    else
      # Se não achou, apenas passa o bastão para frente, mantendo o "aux" do jeito que está.
      do_intersecao_tail(tail, conjunto_b, aux)
    end
  end

end