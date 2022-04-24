---
--- KNAPSACK PROBLEM
---

--- returns list of tuples that have target weight (w) with greater target value (snd ots)
--- ots: list of tuples (weight, value)
knp w ots = knp0 w ots [] []
 
---  w: target weight, ots: original list, ts: solution under exam, bs: 'best solution' so far
knp0 :: Int -> [(Int,Int)] -> [(Int,Int)] -> [(Int,Int)] -> [(Int,Int)]
knp0 _ [] ts bs -- yield the best between between ts e bs
  | kSumVal ts > kSumVal bs = ts
  | otherwise = bs
knp0 w (ot:ots) ts bs
   | kIsValid w (ts ++ [ot]) = knp0 w ots (ts ++ [ot]) (knp0 w ots ts bs) -- ot is compatibile with ts
   | otherwise = knp0 w ots ts bs -- ot is not compatibile with ts, so it ignores it

--- return true if the list of tuples comply with the indicated target weigth
kIsValid :: Int -> [(Int,Int)] -> Bool
kIsValid w ts = w >= (foldl (+) 0 (map fst ts))

--- sum the values of the list of tuples
kSumVal :: [(Int,Int)] -> Int
kSumVal ts = foldl (+) 0 (map snd ts)

--------- test
vs = [20, 5,10,40,15,25]
ws = [1 , 2, 3, 8, 7, 4]
xs = zip ws vs
test1 = (knp 10 xs) == [(1,20),(8,40)]