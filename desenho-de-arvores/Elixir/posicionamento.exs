# Desenho de arvores - secao 3.4.7
# Implementacao do algoritmo de posicionamento em Elixir.

defmodule DesenhoArvores do

  def posicionar({:no, valor, :vazia, :vazia}, nivel, inicio_horizontal, escala) do
    x_da_raiz = inicio_horizontal
    ultimo_x_ocupado = inicio_horizontal
    {
      {:no, valor, :vazia, :vazia, x_da_raiz, nivel * escala},
      x_da_raiz,
      ultimo_x_ocupado
    }
  end
  def posicionar({:no, valor, :vazia, direita}, nivel, inicio_horizontal, escala) do
    resultado_direita = posicionar(direita, nivel + 1, inicio_horizontal, escala)
    {direita_posicionada, x_da_raiz, ultimo_x_ocupado} = resultado_direita
    {
      {:no, valor, :vazia, direita_posicionada, x_da_raiz, nivel * escala},
      x_da_raiz,
      ultimo_x_ocupado
    }
  end
  def posicionar({:no, valor, esquerda, :vazia}, nivel, inicio_horizontal, escala) do
    resultado_esquerda = posicionar(esquerda, nivel + 1, inicio_horizontal, escala)
    {esquerda_posicionada, x_da_raiz, ultimo_x_ocupado} = resultado_esquerda
    {
      {:no, valor, esquerda_posicionada, :vazia, x_da_raiz, nivel * escala},
      x_da_raiz,
      ultimo_x_ocupado
    }
  end
  def posicionar({:no, valor, esquerda, direita}, nivel, inicio_horizontal, escala) do
    resultado_esquerda = posicionar(esquerda, nivel + 1, inicio_horizontal, escala)
    {esquerda_posicionada, x_raiz_esquerda, ultimo_x_esquerda} = resultado_esquerda
    resultado_direita = posicionar(direita, nivel + 1, ultimo_x_esquerda + escala, escala)
    {direita_posicionada, x_raiz_direita, ultimo_x_direita} = resultado_direita
    x_da_raiz = div(x_raiz_esquerda + x_raiz_direita, 2)
    {
      {:no, valor, esquerda_posicionada, direita_posicionada, x_da_raiz, nivel * escala},
      x_da_raiz,
      ultimo_x_direita
    }
  end
end


# No algoritmo do livro em Oz, RootX e RightLim utilizam variáveis dataflow inicialmente não ligadas.
# RootX representa a posição X da raiz, enquanto RightLim indica até onde a subárvore ocupa espaço na horizontal. Essas variáveis recebem seus valores durante o processamento da árvore.

# Em Elixir, não precisei utilizar esse mecanismo, pois fiz cada chamada recursiva devolver uma tupla com a árvore já posicionada, a coordenada X da sua raiz e o último X ocupado.

# O nó pai recebe esses resultados e calcula sua própria coordenada. Quando possui dois filhos, ele calcula a média inteira das posições X das raízes dos filhos, ficando no meio deles.

# Depois, reconstrói a árvore com as coordenadas calculadas e devolve tudo numa nova tupla.

# Dessa forma, substituí as variáveis dataflow do Oz por retornos explícitos. Em vez de criar
# variáveis não ligadas para receber os valores depois, eu recebo a tupla e utilizo pattern matching
# para separar seus elementos e dar nome às informações que preciso. Isso foi necessário porque Elixir não possui o mesmo mecanismo de variáveis dataflow do Oz.


arvore =
  {:no, "A",
    {:no, "B", :vazia, :vazia},
    {:no, "C", :vazia, :vazia}
  }

IO.inspect(DesenhoArvores.posicionar(arvore, 1, 30, 40), pretty: true)
