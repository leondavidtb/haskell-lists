--QUESTÃO 01--
{-Escreva uma definição recursiva da função | intersperse :: a -> [a] -> [a] |
que intercala um elemento entre valores consecurivos em uma lista. Se a lista 
tiver menos de dois valores deve ficar inalterada.
> intersperse 0 [1 .. 4] | Saída : [1,0,2,0,3,0,4]
> intersperse ',' “abcd” | Saída : “a,b,c,d”
> intersperse ',' “a” | Saída : “a”-}
intersperse::a->[a]->[a]
intersperse _ [x] = [x]
intersperse y (x:xs) = x:y:(intersperse y xs)

--QUESTÃO 02--
{-Vamos representar as temperaturas médias de vários dias consecutivos por uma lista de valores
Float. Escreva uma denição da função | subidas :: [Float] -> Int | que calcula quantas vezes a
temperatura subiu (isto é, a temperatura do dia anterior foi estritamente inferior à do dia atual). No
caso de a lista de temperaturas possuir menos que dois valores, o resultado deverá ser 0.
> subidas [19,20,21,22]
> subidas [19,20,20,22]
> subidas [20,19,18,19]
> subidas [20,20]
> subidas [20]
| Saída : 3
| Saída : 2
| Saída : 1
| Saída : 0
| Saída : 0-}
subidas::[Float]->Int
subidas [x] = 0
subidas (x:s:xs) | (x < s)   = 1 + subidas(s:xs)
                 | otherwise = subidas(s:xs)

--QUESTÃO 03--
{-A linguagem dos Ps é um jogo de palavras em que duplicamos cada vogal (letras 'a', 'e', 'i', 'o', 'u')
e colocamos um 'p' entre elas. Todos os outros caracteres seguem inalterados. Escreva uma
definição da função | tranforma :: String -> String | que transforma uma frase para a linguagem dos
Ps. Para simplificar, assuma que a frase não contém letras maiúsculas nem acentuadas.
> transforma "ola, mundo!" | Saída : "opolapa, mupundopo!"
> transforma "4 gatos e 3 ratos" | Saída : "4 gapatopos epe 3 rapatopos"-}
isVogal::Char->Bool
isVogal l | l == 'a'  = True
          | l == 'e'  = True
          | l == 'i'  = True
          | l == 'o'  = True
          | l == 'u'  = True
          | otherwise = False

transforma::String->String
transforma [] = []
transforma (x:xs) = if(isVogal x) then x:'p':x:transforma (xs)
                    else x:transforma (xs)

--QUESTÃO 04--
{-Escreva uma denição da função insert que insere um valor numa lista cujos valores estão em
ordem crescente; se o valor já ocorrer na lista, então deve ser repetido; a lista resultante deve manter
a ordenação. Exemplos:
> insert 3 [1,2,4]
| Saída : [1,2,3,4]
> insert ‘d’ “abcde” | Saída : “abcdde”-}
insert a [] = [a]
insert a [b] | a > b     = [b]++[a]
             | otherwise = [a]++[b]

insert val (x:s:xs) | x <= val && val < s = x : val : s : xs
                    | otherwise           = x : insert val (s:xs)


--QUESTÃO 05--
{-Escreva uma definição da função nodups que remove valores iguais consecutivos de uma lista.
Exemplos:
> nodups [1,1,1,2,1,3,3,4,4] | Saída : [1,2,1,3,4]
> nodups "baannnana"
| Saída : "banana"-}
nodups [a] = [a]
nodups (x:s:xs) | x == s    = nodups (s:xs)
                | otherwise = x : nodups (s:xs)
