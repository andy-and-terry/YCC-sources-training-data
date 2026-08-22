using System;
using System.Collections.Generic;
using System.Linq;

interface IEntity
{
    string Id { get; }
}

interface IRepository<T> where T : IEntity
{
    T? FindById(string id);
    IEnumerable<T> FindAll(Func<T, bool>? predicate = null);
    void Save(T item);
    bool Delete(string id);
}

class InMemoryRepository<T> : IRepository<T> where T : IEntity
{
    private readonly Dictionary<string, T> _items = new();

    public T? FindById(string id) => _items.TryGetValue(id, out var item) ? item : default;

    public IEnumerable<T> FindAll(Func<T, bool>? predicate = null)
    {
        var all = _items.Values.AsEnumerable();
        return predicate is null ? all : all.Where(predicate);
    }

    public void Save(T item) => _items[item.Id] = item;

    public bool Delete(string id) => _items.Remove(id);
}

record User(string Id, string Name, bool Active) : IEntity;

class Program
{
    static void Main()
    {
        IRepository<User> repo = new InMemoryRepository<User>();
        repo.Save(new User("1", "Alice", true));
        repo.Save(new User("2", "Bob", false));

        var activeUsers = repo.FindAll(u => u.Active);
        foreach (var user in activeUsers)
        {
            Console.WriteLine(user.Name);
        }
    }
}
