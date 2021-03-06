--import Data.List (lookup)

--funcs :: [(String, (Num a => a -> a -> a))]
--funcs = [("+",(+)), ("-", (-)), ("*", (*)), ("/", (/)), ("^",(^))]

eval (x:y:rest) "+" = show (read y + read x) : rest
eval (x:y:rest) "-" = show (read y - read x) : rest
eval (x:y:rest) "*" = show (read y * read x) : rest
eval (x:y:rest) "/" = show (read y / read x) : rest
eval (x:y:rest) "^" = show (read y ^ read x) : rest
eval acc next = next : acc

evaluate :: String -> [String]
evaluate = foldl eval [] . words

result :: (Num a, Read a) => String -> a
result =  read . sing . evaluate
    where sing [x] = x