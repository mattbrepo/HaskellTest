import Data.List
import UtilGen

--- Find largest sub-array of consecutive integers
getLSC [] = []
getLSC (x:xs) = getLargest (getLSC0 (x:xs) []) (getLSC xs)

--- Get largest list
getLargest xs ys = if (length xs) > (length ys) then xs else ys

--- Get largest largest sub-array of consecutive integers starting from x
getLSC0 [] ys = ys
getLSC0 (x:xs) ys
  | any (x==) ys = getCons ys
  | length xs == 0 = getCons (ys ++ [x])
  | otherwise = getLSC0 xs (ys ++ [x])

--- Get largest largest sub-array of consecutive integers removing elements from the tail if necessary
getCons xs
  | isCons xs = xs
  | otherwise = getCons (init xs)

--- Is the array made of consecutive integers?
isCons = isCons0 . sort
  where isCons0 [] = True -- giusto per sicurezza
        isCons0 (x:xs)
          | length xs == 0 = True
          | otherwise = ((x + 1) == (head xs)) && (isCons0 xs)

--- Test
testAll = testAll0 getLSC
testAll0 f = test1 f && test2 f && test3 f && test4 f && test5 f
test1 f = (f [0,2,1,4,3,2,1,0,-1]) == [4,3,2,1,0,-1]
test2 f = (f [5,3,2,1,0]) == [3,2,1,0]
test3 f = (f [5,3,2,4,0]) == [5,3,2,4]
test4 f = (f [5,4,3,1,0]) == [5,4,3]
test5 f = (f [0,2,1,5,4,2,3,0,1]) == [5,4,2,3,0,1]

---
--- alternative by using subListTest
---
getLSC_Alternative = last . sortOn length . subListTest isCons
getLSC_Alternative2 = subListBest getLargest isCons 

testAll_Alternative = testAll0 getLSC_Alternative
testAll_Alternative2 = testAll0 getLSC_Alternative2 -- returns false in case like "test3"