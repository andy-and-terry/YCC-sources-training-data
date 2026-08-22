using System;
using System.Collections.Generic;
using System.Linq;

class AnagramGroupsDemo
{
    static List<List<string>> GroupAnagrams(string[] words)
    {
        var groups = new Dictionary<string, List<string>>();
        foreach (var word in words)
        {
            var key = new string(word.OrderBy(c => c).ToArray());
            if (!groups.ContainsKey(key)) groups[key] = new List<string>();
            groups[key].Add(word);
        }
        return groups.Values.ToList();
    }

    static void Main()
    {
        foreach (var group in GroupAnagrams(new[] { "eat", "tea", "tan", "ate", "nat", "bat" }))
            Console.WriteLine(string.Join(",", group));
    }
}
