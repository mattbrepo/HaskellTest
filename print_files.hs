import System.Environment (getArgs)

main = do  
      args <- getArgs
      if length args /= 2 
      then do
        putStrLn "usage: print_files <file 1> <file 2>"
      else do
        f1 <- readFile (head args)
        let s1 = words $ f1
        f2 <- readFile (last args)
        let s2 = words $ f2
        -- print . map readInt . words $ f1
        putStrLn ("--- " ++ (head args))
        print s1
        putStrLn "---"
        putStrLn ("--- " ++ (last args))
        print s2
        putStrLn "---"
        putStrLn ("--- simpleDiff:")
        print (simpleDiff s1 s2)
        putStrLn "---"

simpleDiff :: [String] -> [String] -> [String]
simpleDiff xs ys = foldr f [] xs
  where f x vs = if elem x ys then vs else (x:vs)