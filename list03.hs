--QUESTÃO 01--
{-Um
trio
(x, y, z)
de inteiros positivos diz-se pitagórico se
x 2 + y 2 = z 2 . Dena
a função
pitagoricos :: Int → [(Int, Int, Int)]
que calcule todos os trios cujas componentes não ultrapassem o argumento.
Por exemplo:
pitagoricos 10 = [(3, 4, 5), (4, 3, 5), (6, 8, 10), (8, 6, 10)] .-}
pitagoricos::Int->[(Int,Int,Int)]
pitagoricos n = [(x,y,z) | x<-[1..n],y<-[1..n],z<-[1..n],(x^2)+(y^2)==(z^2)]


--QUESTÃO 02--
{-O problema de decompor uma quantia em trocos pode ser formalizado da seguinte maneira:
n e uma lista de naturais xs , encontrar decomposições de n como soma de valores em xs
(eventualmente com repetições).
Por exemplo, para n = 25 e xs = [2, 5, 10]
[5, 10, 10] (porque 25 = 5 + 10 + 10 ). Outras
[2, 2, 2, 2, 2, 5, 10] (e há mais alternativas).
Escreva uma denição duma função
que
decompor n xs
encontra
todas
uma decomposição possível é
possibilidades são
[5, 5, 5, 5, 5]
decompor :: Int → [Int] → [[Int]]
ou
tal
as alternativas para o problema dos trocos.
O resultado deverá ser a lista vazia quando o problema não tem solução.-}

--QUESTÃO 03--
{-Considere que o tipo InfoNutricional é utilizado para representar informação nutricional sobre
alimentos:
type InfoNutricional = (String, Int, Float, Float)
O primeiro parâmetro representa o nome do alimento, o segundo parâmetro o valor calórico, o
terceiro parâmetro a quantidade de lipidos e o quarto parâmetro a quantidade de glícidos por 100
gramas do alimento. Por exemplo, sabendo que 100 gramas de X têm 100 Kcal, 15.5 gramas de
lı́pidos e 10 gramas de glı́cidos, X seria representado pelo tuplo (”x”, 100, 15.5, 10.0).
Considere ainda que uma refeição consiste numa lista de pares (alimento, quantidade utilizada
na refeição).
Escreva, em Haskell, o módulo Nutricao que deverá:
1. Definir os tipos InfoNutricional e Refeicao.
2. Definir as contantes almoco ::
Refeicao e dispensa ::
[InfoNutricional].
3. Definir as seguites funções:
(a) maisCalorico :: [InfoNutricional] -> InfoNutricional
- - calcula qual o alimento mais calórico de uma lista de alimentos.
(b) getInfoNutricional :: [InfoNutricional] -> String -> InfoNutricional
- - determina a informação existente para um dado alimento.
(c) totalCalorias :: [InfoNutricional] -> Refeicao -> Int
- - com base na informação nutricional, calcula o total de calorias de uma refeição
(d) saudaveis rec :: Float -> [InfoNutricional] -> Refeicao -> [String]
- - calcula quais os alimentos de uma refeição que têm teor de lipidos inferior a um valor
dado (escreva a função utilizando recursividade).
(e) saudaveis nrec :: Float -> [InfoNutricional] -> Refeicao -> [String]
- - igual ao anterior mas escreva a função utilizando listas por compreensão.
(f) saudaveis5 :: [InfoNutricional] -> Refeicao -> [String]
- - igual ao anterior mas calcula quais os alimentos de uma refeição que têm teor de
lı́pidos inferior a 5.0.-}
