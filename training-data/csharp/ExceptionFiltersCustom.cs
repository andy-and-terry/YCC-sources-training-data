using System;

class AppException : Exception
{
    public int Code { get; }
    public AppException(string m, int code, Exception? inner = null) : base(m, inner) { Code = code; }
}

class ExceptionFiltersCustom
{
    static void Main()
    {
        try { throw new AppException("fail", 404); }
        catch (AppException e) when (e.Code >= 500) { Console.WriteLine("server"); }
        catch (AppException e) when (e.Code == 404) { Console.WriteLine("not found " + e.Message); }
        try { try { int.Parse("x"); } catch (FormatException f) { throw new AppException("wrapped", 1, f); } }
        catch (AppException e) { Console.WriteLine(e.InnerException!.GetType().Name); }
        finally { Console.WriteLine("finally"); }
    }
}
