trait DataProcessor {
    fn load(&self) -> Vec<i32>;

    fn process(&self, data: &[i32]) -> Vec<i32>;

    /// The template method: fixes the algorithm's skeleton, delegating the
    /// varying steps to trait methods implementors override.
    fn run(&self) -> Vec<i32> {
        let data = self.load();
        let processed = self.process(&data);
        let mut result = processed;
        result.sort_unstable();
        result
    }
}

struct DoubleProcessor;

impl DataProcessor for DoubleProcessor {
    fn load(&self) -> Vec<i32> {
        vec![3, 1, 4, 1, 5]
    }

    fn process(&self, data: &[i32]) -> Vec<i32> {
        data.iter().map(|x| x * 2).collect()
    }
}

struct SquareProcessor;

impl DataProcessor for SquareProcessor {
    fn load(&self) -> Vec<i32> {
        vec![3, 1, 4, 1, 5]
    }

    fn process(&self, data: &[i32]) -> Vec<i32> {
        data.iter().map(|x| x * x).collect()
    }
}

fn main() {
    println!("{:?}", DoubleProcessor.run());
    println!("{:?}", SquareProcessor.run());
}
