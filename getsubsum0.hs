import UtilGen

--- Get all sub-arrays with sum 0 (with no empty sub-arrays)
getSS0 xs = filter (\ys -> (length ys) > 0) (getSS0_1 xs)

--- Get all sub-arrays with sum 0 and even empty ones
getSS0_1 [] = []
getSS0_1 (x:xs) = (getSS0_0 (x:xs) []):(getSS0_1 xs)

--- Get sub-array with sum 0 starting from x or []
getSS0_0 [] ys = []
getSS0_0 (x:xs) ys
  | isSum0 (ys ++ [x]) = (ys ++ [x])
  | otherwise = getSS0_0 xs (ys ++ [x])

--- Is the sum of the array zero?
isSum0 [] = False
isSum0 xs = (foldl (+) 0 xs) == 0

---
--- alternative by using subListTest
---
getSS0_Alternative = filter (\ys -> (length ys) > 0) . subListTest isSum0
