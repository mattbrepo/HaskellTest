# HaskellTest
Various Haskell tests

**Language: Haskell**

**Start: 2014**

## Why
Gathered here various Haskell tests wrote mainly in 2014 after reading [Real World Haskell](https://en.wikipedia.org/wiki/Real_World_Haskell):

- getsubsum0.hs: Get all sub-arrays with sum 0 (with no empty sub-arrays)
- knapsach.hs: Solutions of the [Knapsack problem](https://en.wikipedia.org/wiki/Knapsack_problem)
- largestsubcons.hs: Find largest sub-array of consecutive integers
- name_permutations.hs: Name permutations
- traprain.hs: Solution of the [Trapping Rain Water problem](https://www.geeksforgeeks.org/trapping-rain-water/)

## Cheatsheet of a few functions

| FUNCTION                                                   | RESULT                            |
| ---------------------------------------------------------- | --------------------------------- |
| length "ciao"                                              | 4                                 |
| null "ciao"                                                | False                             |
| head "ciao"                                                | 'c'                               |
| tail "ciao"                                                | "iao"                             |
| last "ciao"                                                | 'o'                               |
| init "ciao"                                                | "cia"                             |
| take 2 "ciao"                                              | "ci"                              |
| drop 2 "ciao"                                              | "ao"                              |
| "ci" ++ "ao"                                               | "ciao"                            |
| concat \["ci", "ao"\]                                      | "ciao"                            |
| reverse "oaic"                                             | "ciao"                            |
| splitAt 2 "ciao"                                           | ("ci", "ao")                      |
| lines "ciao\\nmiao"                                        | \["ciao", "miao"\]                |
| unlines \["ciao", "miao"\]                                 | "ciao\\nmiao"                     |
| words "ciao miao\\nbau\\ta"                                | \["ciao", "miao", "bau", "a"\]    |
| unwords \["ciao", "miao"\]                                 | "ciao miao"                       |
| and \[True, False\]                                        | False                             |
| or \[True, False\]                                         | True                              |
| all null \["", "ciao"\]                                    | False                             |
| any null \["", "ciao"\]                                    | True                              |
| takeWhile (/= 'a') "ciao"                                  | "ci"                              |
| dropWhile (/= 'a') "ciao"                                  | "ao"                              |
| span even \[2..4\]                                         | (\[2\],\[3,4\])                   |
| break even \[1..4\]                                        | (\[1\],\[2,3,4\])                 |
| elem 'a' "abc"                                             | True                              |
| notElem 'a' "abc"                                          | False                             |
| zip "ciao" "123"                                           | \[('c','1'),('i','2'),('a','3')\] |
| zipWith (\\a b -> if a == 'o' then b else a) "ciao" "1234" | "cia4"                            |
