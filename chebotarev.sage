def chebotarev(g, N):
    cycleTypeList = [];
    d = g.discriminant();
    i = 0;

    for p in primes_first_n(N):
        if d % p != 0:
            F = GF(p)['x'](g).factor();
            cT = cycleType(F);
            for j, (l, n) in enumerate(cycleTypeList):
                if cT == l:
                    cycleTypeList[j] = (l, n + 1);
                    break
            else:
                cycleTypeList.append((cT, 1));

    percentage(cycleTypeList);
    return cycleTypeList;




def cycleType(F):
    ret = [[f.degree()] * k for f, k in F];
    ret = [item for lst in ret for item in lst];
    ret.sort();
    return ret;


def percentage(lst):
    ges = sum(n for _, n in lst);
    lst[:] = [(a, N(100 * n / ges, 15)) for a, n in lst];