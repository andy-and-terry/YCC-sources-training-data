using System;
using System.ComponentModel;
using System.Runtime.CompilerServices;

class NotifyPropertyChangedDemo
{
    class ViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler? PropertyChanged;
        private string _title = "";
        private int _count;

        public string Title { get => _title; set => Set(ref _title, value); }
        public int Count { get => _count; set => Set(ref _count, value); }

        private void Set<T>(ref T field, T value, [CallerMemberName] string? name = null)
        {
            if (Equals(field, value)) return;
            field = value;
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }

    static void Main()
    {
        var vm = new ViewModel();
        vm.PropertyChanged += (s, e) => Console.WriteLine($"changed: {e.PropertyName}");
        vm.Title = "Hello";
        vm.Title = "Hello";
        vm.Count = 3;
        vm.Count++;
    }
}
