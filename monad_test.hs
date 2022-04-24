import Prelude hiding ((>>=), return)

type Choice a = [a]

choose :: [a] -> Choice a
choose xs = xs

pair456 :: Int -> Choice (Int,Int)
pair456 x = choose [(x,4), (x,5), (x,6)]

join' :: [[a]] -> [a]
join' choices = concat choices

(>>=) :: [a] -> (a -> [b]) -> [b]
choices >>= f = join' (map f choices)

return :: a -> [a]
return x = [x]

makePairs' :: Choice (Int,Int)
makePairs' = do
  x <- choose [1,2,3]
  y <- choose [4,5,6]
  return (x,y)

--- makePairs2 :: Choice (Int,Int)
makePairs2 = do
  let x = choose [1,2,3]
  let y = choose [4,5,6]
  (x,y)
  
makePairs3 = do
  x <- [1,2,3]
  y <- [4,5,6]
  return (x,y)
  
-- mzero = []

guard True = return ()
guard False = []

solveConstraint = do
  x <- [1,2,3]
  y <- [4,5,6]
  guard (x*y == 8)
  return (x,y)

--- [1..3] >>= (\x -> [x, 10 + x]) >>= (\x -> if x == 2 || x > 10 then [x] else [])