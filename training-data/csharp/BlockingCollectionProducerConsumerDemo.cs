using System;
using System.Collections.Concurrent;
using System.Threading;

class BlockingCollectionProducerConsumerDemo
{
    static void Main()
    {
        var queue = new BlockingCollection<int>(boundedCapacity: 5);

        var producer = new Thread(() =>
        {
            for (int i = 1; i <= 10; i++)
            {
                queue.Add(i);
            }
            queue.CompleteAdding();
        });

        var consumer = new Thread(() =>
        {
            foreach (int item in queue.GetConsumingEnumerable())
            {
                Console.WriteLine("consumed: " + item);
            }
        });

        producer.Start();
        consumer.Start();
        producer.Join();
        consumer.Join();
    }
}
