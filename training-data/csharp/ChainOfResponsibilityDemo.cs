using System;

abstract class ApprovalHandler
{
    protected ApprovalHandler Next;

    public ApprovalHandler SetNext(ApprovalHandler next)
    {
        Next = next;
        return next;
    }

    public abstract void Handle(int amount);
}

class TeamLeadApproval : ApprovalHandler
{
    public override void Handle(int amount)
    {
        if (amount <= 1000) Console.WriteLine($"Team lead approved {amount}");
        else if (Next != null) Next.Handle(amount);
    }
}

class ManagerApproval : ApprovalHandler
{
    public override void Handle(int amount)
    {
        if (amount <= 10000) Console.WriteLine($"Manager approved {amount}");
        else if (Next != null) Next.Handle(amount);
    }
}

class DirectorApproval : ApprovalHandler
{
    public override void Handle(int amount) => Console.WriteLine($"Director approved {amount}");
}

class ChainOfResponsibilityDemo
{
    static void Main()
    {
        var teamLead = new TeamLeadApproval();
        var manager = new ManagerApproval();
        var director = new DirectorApproval();
        teamLead.SetNext(manager).SetNext(director);

        foreach (var amount in new[] { 500, 5000, 50000 })
        {
            teamLead.Handle(amount);
        }
    }
}
