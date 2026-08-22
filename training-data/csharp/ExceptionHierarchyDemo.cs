using System;

class ApiException : Exception
{
    public ApiException(string message) : base(message) { }
}

class NotFoundException : ApiException
{
    public NotFoundException(string resource) : base($"{resource} not found") { }
}

class ValidationException2 : ApiException
{
    public ValidationException2(string field, string message) : base($"invalid field '{field}': {message}") { }
}

class ExceptionHierarchyDemo
{
    static void FetchResource(int id)
    {
        if (id < 0) throw new ValidationException2("id", "must be non-negative");
        if (id > 100) throw new NotFoundException($"resource {id}");
    }

    static void Main()
    {
        try { FetchResource(999); }
        catch (ApiException e) { Console.WriteLine($"error: {e.Message}"); }

        try { FetchResource(-1); }
        catch (ApiException e) { Console.WriteLine($"error: {e.Message}"); }
    }
}
