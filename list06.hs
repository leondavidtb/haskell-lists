--QUESTÃO 01--

module Main where
import Data.Char(isLetter)

myIsLetter::String->Bool
myIsLetter [] = True
myIsLetter (x:xs) = if (isLetter(x) == True) then myIsLetter xs
                    else False

main::IO()
main = do putStr "Digite uma string "
          str <- getLine
          if(myIsLetter str) then putStrLn(reverse str)
          else putStrLn "ERRO"


--QUESTÃO 1.1--
{-main::IO()
main = do putStrln "Digite uma palavra"
          str <- getLine
          if(str == ' ') then return
          else do
          	     if(myIsLetter str) then putStrln (reverse(str))
          	     else putStrln "ERRO"
                 main
-}

--QUESTÃO 02--
main2::IO()
main2 = do putStrln "Digite uma palavra"
           str <- getLine
           if(str == " ") then return()
           else putStrln(upper(str))
           main2

upper::String->String
upper[] = []
upper (x:xs) = upper x : upper xs

--QUESTÃO 03--
lerInteiros::IO()
lerInteiros = do n <- getLine
                 return (read n)

lerIntList::IO([Int])
lerIntList = do putStrln "Digite um inteiro"
                x <- lerInteiros
                if(x == 0) then return ([])
                else do xs <- lerIntList
                        return(x:xs)
somaElementos::IO(Int)
somaElementos = sum lerIntList

--QUESTÃO 04--
funcao::IO()
funcao = do putStrln "Digite um número"
            n <- lerInteiros
            print([i, i*2] | i<- [1..n])

--QUESTÃO 05--
split::String->[String]
split [] = [" "]
split (x:xs) = takeWhile(\x -> x == " ") (x:xs) : 
               split(dropWhile(x-> x ==' ') (x:xs))
