--QUESTÃO 01--
{-Apresente uma função recursiva que recebe uma lista de Inteiros e retorna o
par (Tupla) (Primeiro, Último) contendo o primeiro e o último elemento dessa
lista.-}
tupla::[Int]->(Int,Int)
tupla lista = (head lista, last lista)

--QUESTÃO 02--
{-Implemente uma função chamada “palindromo” que recebe como
parâmetros dois inteiros N e M e retorna um gerador de palídromos para os
números de N até M (Lista).
Ex:
Entrada: 1 3 | Saída : [1,2,3,3,2,1]
Entrada: 3 6 | Saída : [3,4,5,6,6,5,4,3,2,1]-}
palindromo::Int->Int->[Int]
palindromo n m = [n..m] ++ reverse[n..m]

--QUESTÃO 03--
{-Escreva uma função “getElement” que recebe uma lista e um número inteiro
positivo para retornar o n-ésimo elemento da lista.
ex.: getElement 1 [3, 7, 4, 2] = 3-}
getElement::[Int]->Int->Int
getElement lista x = lista !! x-1

--QUESTÃO 04--
{-Escreva uma função “contains” recebe uma lista e um elemento qualquer e
verifica se o elemento pertence lista.
ex.: contains 1 [3,7,4,2] = False-}
contains::[Int]->Int->Bool
contains [] n = False
contains (x:xs) n = if(x == n) then True else contains (xs) n

--QUESTÃO 05--
{-Escreva uma função “sizeList” que recebe uma lista qualquer e retorna o
número de elementos na lista.
obs.: não usar a função length-}
sizeList::[Int]->Int
sizeList [] = 0
sizeList (x:xs) = 1 + sizeList (xs)

--QUESTÃO 06--
{-Escreva uma função chamada “nMedia” que recebe um inteiro, uma lista de
inteiros e retorna a média dos n-primeiros elementos dessa lista.
Ex: nMedia 3 [1,2,3,4,5] = 2
nMedia 4 [1,4,1,2,4,3] = 2-}
soma::[Int]->Int->Int
soma _ 0 = 0
soma [] _ = 0
soma (x:xs) n = x + (soma xs (n-1))

nMedia::[Int]->Int->Float
nMedia lista n =  fromIntegral(soma lista n) / fromIntegral n

--QUESTÃO 07--
{-Elabore uma função “mult” ( recursiva ) que recebe dois parâmetros inteiros
(x) (y) e retorna (x * y) inteiro. Obs: O programador não deve usar os
operadores de + ou -, EXCETO para montar duas funções de apoio :
suc::Int→Int e ant::Int→Int-}
suc::Int->Int
suc x = x + 1

ant::Int->Int
ant x = x - 1

soma1::Int->Int->Int
soma1 x 0 = x
soma1 x y = soma1(suc x) (ant y) 

mult::Int->Int->Int
mult _ 0 = 0
mult x 1 = x
mult x y = soma1 x (mult x (ant y))

--QUESTÃO 08--
{-Elabore outra função “dobroList” (Recursiva) que para cada elemento de
uma lista (como entrada) multiplica por 2. (Utilize a estratégia “Currying” de
acordo com a função do exercício 7).
Ex. dobroList [ 1, 4 , 5 ] = [ 2, 8 ,10]-}
mult1::Int->Int
mult1 = mult 2

dobroList::[Int]->[Int]
dobroList [] = []
dobroList (x:xs) = mult1 x : dobroList xs
