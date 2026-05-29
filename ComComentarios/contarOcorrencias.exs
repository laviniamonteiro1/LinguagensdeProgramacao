defmodule Simulado.ContarOcorrencias do

  # ==========================================
  # RECURSÃO SEM CAUDA (A Pilha Cresce)
  # ==========================================
  
  # Caso base: Se a lista acabou (ou chegou vazia), o elemento aparece 0 vezes.
  def contar_ocorrencias(_, []) do
    0
  end

  # O VILÃO DA MEMÓRIA (Quando acha o elemento):
  # Se o primeiro item da lista for igual ao elemento que estamos buscando, 
  # a função soma 1 (+), mas FICA ESPERANDO o resto da lista terminar de ser contada.
  def contar_ocorrencias(elemento, [elemento | tail]) do
    1 + contar_ocorrencias(elemento, tail)
  end

  # O VILÃO DA MEMÓRIA (Quando NÃO acha o elemento):
  # Se o primeiro item for diferente (_head), ele apenas ignora e chama a função 
  # para o resto da lista, ainda empilhando na memória.
  def contar_ocorrencias(elemento, [_head | tail]) do
    contar_ocorrencias(elemento, tail)
  end


  # ==========================================
  # RECURSÃO COM CAUDA (Otimizada)
  # ==========================================
  
  # Porta de entrada: O usuário manda o elemento e a lista.
  # Iniciamos o nosso contador auxiliar (aux) com 0.
  def contar_ocorrencias_tail(elemento, lista) do
    do_contar_ocorrencias_tail(elemento, lista, 0)
  end

  # Caso base: A lista esvaziou. Devolvemos o valor final do "aux".
  defp do_contar_ocorrencias_tail(_, [], aux) do
    aux
  end

  # A MÁGICA (Quando acha o elemento):
  # Em vez de esperar para somar no final, a função soma 1 no "aux" DENTRO dos parênteses.
  # O novo total já vai pronto para a próxima rodada.
  defp do_contar_ocorrencias_tail(elemento, [elemento | tail], aux) do
    do_contar_ocorrencias_tail(elemento, tail, aux + 1)
  end

  # A MÁGICA (Quando NÃO acha o elemento):
  # Simplesmente passa o bastão para frente, mantendo o "aux" do jeito que está,
  # pois não achamos nada para contar nessa rodada.
  defp do_contar_ocorrencias_tail(elemento, [_head | tail], aux) do
    do_contar_ocorrencias_tail(elemento, tail, aux)
  end

end