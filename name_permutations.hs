dIT = ["Bit", "Byte", "Info", "Comp", "Ware", "Soft", "Software", "Micro", "Tera", "Giga", "Mega", "Dev"]
dTeam = [ "Team", "Wise", "Group", "Solutions"]
dSci = ["Science", "Sci", "Chem", "Chemistry", "Alchemy", "Math"]

dict = dIT ++ dTeam ++ dSci

mixDict2 d1 d2 = [ xs ++ ys | xs <- d1, ys <- d2] ++ [ xs ++ ys | xs <- d2, ys <- d1]
mixDict3 d1 d2 d3 = [ xs ++ ys ++ zs | xs <- d1, ys <- d2, zs <- d3] ++
                    [ xs ++ ys ++ zs | xs <- d1, ys <- d3, zs <- d2] ++
                    [ xs ++ ys ++ zs | xs <- d2, ys <- d1, zs <- d3] ++
                    [ xs ++ ys ++ zs | xs <- d2, ys <- d3, zs <- d1]

-- res2 = [ xs ++ ys | xs <- dict, ys <- dict, xs /= ys]
-- res3 = [ xs ++ ys ++ zs | xs <- dict, ys <- dict, zs <- dict, (xs /= ys && xs /= zs && ys /= zs)]
res2 = (mixDict2 dIT dSci) ++ (mixDict2 dTeam dSci)
res3 = mixDict3 dIT dTeam dSci
