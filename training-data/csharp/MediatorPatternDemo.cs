using System;
using System.Collections.Generic;

interface IChatMediator
{
    void Broadcast(string from, string message);
    void Register(ChatUser user);
}

class ChatRoom : IChatMediator
{
    private readonly List<ChatUser> _users = new();

    public void Register(ChatUser user) => _users.Add(user);

    public void Broadcast(string from, string message)
    {
        foreach (var user in _users)
        {
            if (user.Name != from) user.Receive(from, message);
        }
    }
}

class ChatUser
{
    private readonly IChatMediator _mediator;
    public string Name { get; }

    public ChatUser(IChatMediator mediator, string name)
    {
        _mediator = mediator;
        Name = name;
        _mediator.Register(this);
    }

    public void Send(string message) => _mediator.Broadcast(Name, message);

    public void Receive(string from, string message) => Console.WriteLine($"{Name} received from {from}: {message}");
}

class MediatorPatternDemo
{
    static void Main()
    {
        var room = new ChatRoom();
        var alice = new ChatUser(room, "Alice");
        var bob = new ChatUser(room, "Bob");
        var carol = new ChatUser(room, "Carol");

        alice.Send("hello everyone");
        bob.Send("hi Alice");
        carol.Send("count me in");
    }
}
