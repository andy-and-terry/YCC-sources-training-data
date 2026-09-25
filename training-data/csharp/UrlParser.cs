using System;
using System.Linq;
using System.Web;

class UrlParser
{
    static void Describe(string raw)
    {
        if (!Uri.TryCreate(raw, UriKind.Absolute, out var uri))
        {
            Console.WriteLine($"invalid: {raw}");
            return;
        }
        var query = HttpUtility.ParseQueryString(uri.Query);
        string q = string.Join(", ", query.AllKeys.Select(k => $"{k}={query[k]}"));
        Console.WriteLine($"scheme={uri.Scheme} user={uri.UserInfo} host={uri.Host} port={uri.Port} path={uri.AbsolutePath} query=[{q}] fragment={uri.Fragment}");
    }

    static void Main()
    {
        Describe("https://user:pw@example.com:8443/a/b?x=1&y=hello%20world#top");
        Describe("http://localhost");
        Describe("not a url");
        Console.WriteLine(new Uri(new Uri("https://example.com/docs/guide/"), "../api?v=2"));
    }
}
