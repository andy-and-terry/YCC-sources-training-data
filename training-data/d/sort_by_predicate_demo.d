import std.stdio;
import std.algorithm : sort, SwapStrategy, uniq, isSorted;
import std.array : array;

struct Person
{
    string name;
    int age;
}

void main()
{
    auto people = [Person("Ann", 31), Person("Bob", 25), Person("Cy", 31), Person("Di", 19)];

    people.sort!((a, b) => a.age < b.age || (a.age == b.age && a.name > b.name));
    foreach (p; people)
        writeln(p.name, " ", p.age);

    people.sort!("a.name < b.name");
    writeln(people.isSorted!((a, b) => a.name < b.name));

    auto nums = [3, 1, 3, 2, 1];
    writeln(nums.sort.uniq.array);
}
