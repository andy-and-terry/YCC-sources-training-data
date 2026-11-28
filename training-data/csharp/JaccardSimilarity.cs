using System;
using System.Collections.Generic;
using System.Linq;

class JaccardSimilarity
{
    static double Jaccard<T>(IEnumerable<T> a, IEnumerable<T> b)
    {
        var sa = new HashSet<T>(a);
        var sb = new HashSet<T>(b);
        int inter = sa.Intersect(sb).Count();
        int union = sa.Union(sb).Count();
        return union == 0 ? 1.0 : (double)inter / union;
    }

    static void Main() => Console.WriteLine(Jaccard(new[] { 1, 2, 3, 4 }, new[] { 3, 4, 5 }));
}
