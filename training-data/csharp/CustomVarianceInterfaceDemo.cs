using System;

interface IProducer<out T>
{
    T Produce();
}

interface IConsumer<in T>
{
    void Consume(T item);
}

class Creature
{
    public string Name = "creature";
}

class Puppy : Creature { }

class PuppyFactory : IProducer<Puppy>
{
    public Puppy Produce() => new Puppy { Name = "Rex" };
}

class CreatureLogger : IConsumer<Creature>
{
    public void Consume(Creature item) => Console.WriteLine($"logging {item.Name}");
}

class CustomVarianceInterfaceDemo
{
    static void PrintProduced(IProducer<Creature> producer) => Console.WriteLine(producer.Produce().Name);

    static void ConsumePuppy(IConsumer<Puppy> consumer, Puppy puppy) => consumer.Consume(puppy);

    static void Main()
    {
        IProducer<Puppy> puppyFactory = new PuppyFactory();
        // Covariant: IProducer<Puppy> can be used wherever IProducer<Creature> is expected.
        PrintProduced(puppyFactory);

        IConsumer<Creature> logger = new CreatureLogger();
        // Contravariant: IConsumer<Creature> can be used wherever IConsumer<Puppy> is expected.
        ConsumePuppy(logger, new Puppy { Name = "Fido" });
    }
}
