defmodule Calculadora do
  def executar(operacao) do
    case operacao do
        {:soma, x, y} -> x+y
        {:multiplicacao, x, y} -> x*y
        {:subtracao, x, y} -> x-y
        {:divisao, x, y} -> x/y
        _ -> :operacao_invalida
    end
  end
end

#IO.inspect(Calculadora.executar({12, 10, 5}))

defmodule Matematica do
    def potencia(0) do 1 end
    def potencia(n) when n > 0 do
        2*potencia(n-1)
    end
    def potencia(n) when n < 0 do
        0.5*potencia(n+1)
    end
end

#IO.inspect(Matematica.potencia(-4))

defmodule Lista do
    def soma([], s) do s end
    def soma([cabeca|cauda], s) do
        soma(cauda, s+cabeca)
    end
end

#IO.inspect(Lista.soma([10,20,5,7], 0))

defmodule Arvore do
    def analisar(:vazia) do {0,0} end
    def analisar({:no, _, esquerda, direita}) do
        {quantidade_e, altura_e} = analisar(esquerda)
        {quantidade_d, altura_d} = analisar(direita)
        {quantidade_d + quantidade_e + 1, max(altura_d, altura_e)+1}
    end
    def marcar_niveis(:vazia, _nivel, _escala) do
        :vazia
    end
    def marcar_niveis({:no, valor, esquerda, direita}, nivel, escala) do
        no1 = marcar_niveis(esquerda, nivel+1, escala)
        no2 = marcar_niveis(direita, nivel+1, escala)
        {:no, valor, nivel*escala, no1, no2}
    end
end


arvore =
  {:no, "A",
    {:no, "B", :vazia, :vazia},
    {:no, "C", :vazia, :vazia}
  }

#IO.inspect(Arvore.count(arvore))
#{quantidade, altura} = Arvore.analisar(arvore)
#IO.inspect(quantidade)
#IO.inspect(altura)

IO.inspect(Arvore.marcar_niveis(arvore, 1, 30))
