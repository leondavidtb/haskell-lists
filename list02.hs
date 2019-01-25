--QUESTÃO 01--
{-Defina uma função max3 que recebe como entrada 3 inteiros e retorna o maior
entre eles.
Entrada : max3 3 2 5 | Saída : 5
* Obs: Implemente de duas formas usando uma função auxiliar "max" e sem esse
função.-}
--usando função max--
max3::Int->Int->Int->Int
max3 x y z = if(x > y) then max x z else max y z

--sem usar função max--
max4::Int->Int->Int->Int
max4 x y z | x >= y && y >= z = x
           | x >= z && z >= y = x
           | y >= x && x >= z = y
           | y >= z && z >= x = y
           | z >= x && x >= y = z
           | z >= y && y >= x = z

--QUESTÃO 02--
{-Crie uma função que intercala os elementos de duas listas, de qualquer
tamanho, contendo números inteiros, numa nova lista .
Entrada : [ 1 , 3 , 4] [ 2 , 5 ]
Saída : [ 1 , 2 , 3 , 5 , 4]-}
interLista::[Int]->[Int]->[Int]
interLista [] [] = []
interLista [] y = y
interLista x [] = x
interLista (x:xs) (y:ys) = if(x /= y) then [x,y]++(interLista xs ys) 
                           else [x]++interLista xs ys

--QUESTÃO 03--
{-A função a seguir retorna a área de um triângulo apenas quando as medidas dos
lados do triângulo são válidas. Isto acontece somente quando cada medida é
positiva e menor do que a soma das medidas dos outros dois lados. Caso as
medidas não sejam válidas, o resultado da função é zero.
Utiliza-se a forma de Hieron.
Utilizando a linguagem Haskell, implemente uma função que recebe os parâmetros
a b c (Inteiros) e retornar a área A do triângulo.-}
areaTriangulo::Float->Float->Float->Float
areaTriangulo a b c = if(isValid) then sqrt expr
	                  else 0
	                  where isValid = (a<b+c) && (b<a+c) && (c<a+b) 
	                        expr = s*(s-a)*(s-b)*(s-c)
	                        s = (a+b+c)/2

--QUESTÃO 04--
{-A NF (nota final) de um aluno é medida por meio de 3 notas atribuídas,
respectivamente, a um trabalho de laboratório (TL), a uma avaliação semestral(AS) 
e a um exame final (AF). A média ponderada das três notas mencionadas
obedece aos pesos a seguir:
Implemente uma função que recebe os valores dessas notas e retorna um conceito
para o aluno de acordo com a tabela abaixo:
Entrada: Funcao1 10 10 9
Saída: A-}
somaNum::[Float]->[Float]->Float
somaNum [] [] = 0
somaNum notas pesos = head(notas) * head(pesos) + somaNum(tail(notas)) (tail(pesos))

media::[Float]->[Float]->Float
media notas pesos = fromIntegral(somaNum notas pesos) / fromIntegral(sum pesos)

conceito::Float->Char
conceito media = if (media>8.0 && media<=10.0) then 'A'
                 else if (media>7.0 && media<=8.0) then 'B'
                 else if (media>6.0 && media<=7.0) then 'C'
                 else if (media>5.0 && media<=6.0) then 'C'
                 else if (media>0.0 && media<=5.0) then 'D'
                 else '0'

--QUESTÃO 05--
{-Um fotógrafo cobra de seus clientes por retratos antigos, baseando-se no
número de indivíduos incluídos na fotografia. As tarifas constam da tabela
seguinte:
Retratos antigos tirados aos sábados ou aos domings custam 20% a mais do que o
preço base.
Defina uma função precoRetrato do tipo (Integer -> String -> Double) que recebe
como argumentos o número de pessoas no retrato e o dia da semana agendado, e
calcula o custo do retrato.-}
