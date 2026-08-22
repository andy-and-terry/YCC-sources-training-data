using System;
using System.Collections.Generic;

interface IIdentifiable
{
    string Id { get; }
}

class Repository<T> where T : IIdentifiable
{
    private readonly Dictionary<string, T> items = new();

    public void Save(T item) => items[item.Id] = item;

    public T FindById(string id) => items.TryGetValue(id, out var item) ? item : default;

    public IEnumerable<T> FindAll(Func<T, bool> predicate = null) =>
        predicate == null ? items.Values : System.Linq.Enumerable.Where(items.Values, predicate);
}

record User(string Id, string Name, bool Active) : IIdentifiable;

class GenericConstraints
{
    static void Main()
    {
        var repo = new Repository<User>();
        repo.Save(new User("1", "Alice", true));
        repo.Save(new User("2", "Bob", false));

        foreach (var u in repo.FindAll(u => u.Active)) Console.WriteLine(u.Name);
    }
}
