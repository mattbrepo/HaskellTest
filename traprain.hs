-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
----- TRAPPING RAIN PROBLEM
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
---  
---  Trapping Rain Water within given set of bars
---  Input: Array containing height of bars {7, 0, 4, 2, 5, 0, 6, 4, 0, 5}
---  Maximum amount of water that can be trapped is 25 as shown below (in blue color).
---
---  The idea is to calculate maximum height bar on the left and right of every bar. 
---  Then the amount of water that can be stored on top of each bar is equal to minimum 
---  among maximum bar to the left and right minus height of current bar.
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

--- calcola tutta la pioggia contenuta (es: [7,0,4,2,5,0,6,4,0,5] == 25)
trapRain xs = tR0 (breakUntil xs)
  where tR0 (befs,[]) = calcTrappedRain befs
        tR0 (befs,afts) = (calcTrappedRain befs) + (tR0 (breakUntil afts))

--- calcola la pioggia intrappolata in una cavità ben delimitata (es: [7, 0, 4, 2, 5, 0, 6] e non tutto [7, 0, 4, 2, 5, 0, 6, 4, 0, 5])
calcTrappedRain (x:xs) = cTR0 (min x (last xs)) (init xs)
  where cTR0 top xs = foldl f 0 xs
          where f r v = r + top - v

--- spezza in una tupla (x:xs) per identificare una cavità prima (befs, es: [7, 0, 4, 2, 5, 0, 6]) e il resto dello spazio da analizzare dopo (afts, es: [6, 4, 0, 5])
breakUntil (x:xs) = f (break (\y -> y == (maxUntil x 0 xs)) (x:xs))
  where f (befs,afts) = (befs ++ [head(afts)],afts)

--- restituisce il primo numero maggiore o uguale a n altrimenti il massimo numero di xs
maxUntil n nmax [] = nmax
maxUntil n nmax (x:xs)
  | x >= n = x
  | otherwise = maxUntil n (max x nmax) xs

------------------------------------------------------------
test1 = trapRain [7,0,4,2,5,0,6,4,0,5] == 25