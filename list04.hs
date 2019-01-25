--QUESTÃO 01--
{-Escreva uma função “maxDiv” que retorna o maior número no intervalo [x,y] que é
divisível por n.
Exemplo:
maxDiv 2 0 10 = 10 | maxDiv 2 0 15 = 14 | maxDiv 3829 10 100000 = 99554-}
div1::Int->[Int]->Int
div1 _ [] = -2
div1 n (x:xs) | mod x n == 0 = x
              | otherwise = div1 n xs

maxDiv::Int->Int->Int->Int
maxDiv a b c = div1 a (reverse [b..c])

--QUESTÃO 02--
{-A função elimAdj remove elementos adjacentes duplicados de uma lista. Por exemplo:
elimAdj [1,2,2,3,3,3,3,1,1] = [1,2,3,1]
Implemente a função elimAdj.-}
elimAdj::[Int]->[Int]
elimAdj [] = []
elimAdj (x:[]) = [x]
elimAdj (x:s:xs) = if(x == s) then elimAdj (s:xs) else x:elimAdj (s:xs)

--QUESTÃO 03--
{-Defina uma função getInt::[Int]→Int que converte uma lista de dígitos decimais num
inteiro.
Exemplo: getInt [2, 3, 4, 5] = 2345-}
forDecimal::Int->Int->Int
forDecimal a b = (a*10)+b

get::[Int]->Int
get [] = 0
get (x:xs) = forDecimal (get xs) x

getInt::[Int]->Int
getInt lista = get (reverse lista)

--QUESTÃO 04--
{-Defina uma função repeteAt :: (a → Bool) → (a → a) → a → a | a mesma repete
sucessivamente a aplicação de uma f(x) ao argumento até que outra p(x) seja verdade,
retornando o valor encontrado.
Ex : until (\x→ x == 10) (+1) 3 | Saída : 10
Ex : until (\x→ x == 10) (+3) 3 | Saída : Loop Infinito (Ctrl + c) Interromper.-}
repeteAt::(a->Bool)->(a->a)->a->a
repeteAt f p x = if(f x) then x else repeteAt f p (p x)

--QUESTÃO 05--
{-Defina uma função unzip::[ ( Int , Int ) ]→ ( [Int] , [Int] ) que transforma uma lista de
pares em um par de listas.
*Sugestão: defina antes as funções unZipLeft, unZipRight:: [ ( Int , Int ) ]→ [ Int ], onde:
unZipLeft [ ( 2 , 4 ) , ( 3 , 5 ) , ( 4 , 78 ) ] = [ 2 , 3 , 4 ] e
unZipRight [ ( 2 , 4 ) , ( 3 , 5 ) , ( 4 , 78 ) ] = [ 4 , 5 , 78].-}
unZipL::[(Int, Int)] -> [Int]
unZipL [] = []
unZipL ((a,b):xs) = a : unZipL xs

unZipR::[(Int, Int)] -> [Int]
unZipR [] = []
unZipR ((a,b):xs) = b : unZipR xs

unZip::[(Int, Int)]->([Int], [Int])
unZip [] = ([],[])
unZip lista = (unZipR lista, unZipL lista)

--QUESTÃO 08--
{-Escreva uma função “applyPairFunc” com características de Alta Ordem, ou seja, recebe
ou retorna outra função no Haskell para computar f (x,y) entre duas listas “A” e “B” de
inteiros e retornar outra lista de inteiros “C”, contendo o resultado f (x,y) | x ∈ A e y ∈ B
para cada elemento das listas de entrada.
Sua função deve receber uma função que recebe dois valores inteiros, duas listas e retornar
outra lista.Ex1: Suponha a f(x,y) = x*y + 5 |
Entrada: lista A [ 1,2 ] lista B [2,3]
Saída: [ 7, 11 ]
Ex2: Suponha a f(x,y) = x*y + 5 |
Entrada: lista A [ 1,2 ,3 ] lista B [2,3]
Saída: [ 7, 11 ]
ghci: applyPairFunc (\x y→x*y+5) [1,2] [2,3]
[7 , 11]
*Note que (Ex2) a computação da função passada por parâmetro deve ser realizada apenas
nos primeiros elementos do menor vetor.
a) Implemente usando lista de compressão.
b) Implemente usando recursão.-}
