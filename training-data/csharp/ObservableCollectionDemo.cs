using System;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

// ObservableCollection<T> raises CollectionChanged whenever items
// are added, removed, replaced or the collection is reset.
class Program
{
    static void OnChanged(object sender, NotifyCollectionChangedEventArgs e)
    {
        switch (e.Action)
        {
            case NotifyCollectionChangedAction.Add:
                Console.WriteLine($"Added {e.NewItems[0]} at {e.NewStartingIndex}");
                break;
            case NotifyCollectionChangedAction.Remove:
                Console.WriteLine($"Removed {e.OldItems[0]} from {e.OldStartingIndex}");
                break;
            case NotifyCollectionChangedAction.Replace:
                Console.WriteLine($"Replaced {e.OldItems[0]} with {e.NewItems[0]}");
                break;
            case NotifyCollectionChangedAction.Move:
                Console.WriteLine($"Moved {e.OldStartingIndex} -> {e.NewStartingIndex}");
                break;
            case NotifyCollectionChangedAction.Reset:
                Console.WriteLine("Cleared");
                break;
        }
    }

    static void Main()
    {
        var items = new ObservableCollection<string>();
        items.CollectionChanged += OnChanged;

        items.Add("alpha");
        items.Add("beta");
        items.Insert(0, "zero");
        items[1] = "ALPHA";
        items.Move(0, 2);
        items.Remove("beta");
        items.Clear();
        Console.WriteLine(items.Count);
    }
}
