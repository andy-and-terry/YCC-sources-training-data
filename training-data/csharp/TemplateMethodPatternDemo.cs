using System;

abstract class DataProcessor
{
    public void Process()
    {
        LoadData();
        TransformData();
        SaveData();
    }

    protected abstract void LoadData();
    protected abstract void TransformData();

    protected virtual void SaveData() => Console.WriteLine("Saving processed data.");
}

class CsvDataProcessor : DataProcessor
{
    protected override void LoadData() => Console.WriteLine("Loading data from CSV.");
    protected override void TransformData() => Console.WriteLine("Transforming CSV rows.");
}

class JsonDataProcessor : DataProcessor
{
    protected override void LoadData() => Console.WriteLine("Loading data from JSON.");
    protected override void TransformData() => Console.WriteLine("Transforming JSON nodes.");
    protected override void SaveData() => Console.WriteLine("Saving JSON output.");
}

class TemplateMethodPatternDemo
{
    static void Main()
    {
        DataProcessor csv = new CsvDataProcessor();
        csv.Process();

        DataProcessor json = new JsonDataProcessor();
        json.Process();
    }
}
