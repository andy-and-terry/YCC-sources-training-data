// A minimal single-threaded async/await executor built on only std,
// to show what `async fn` desugars into and how polling drives it.
use std::future::Future;
use std::pin::Pin;
use std::sync::Arc;
use std::task::{Context, Poll, Wake, Waker};
use std::collections::VecDeque;

struct NoopWaker;

impl Wake for NoopWaker {
    fn wake(self: Arc<Self>) {}
}

fn noop_waker() -> Waker {
    Waker::from(Arc::new(NoopWaker))
}

// A future that becomes ready only after being polled `remaining` times,
// simulating a task that needs to wait on something.
struct CountdownFuture {
    remaining: u32,
    label: &'static str,
}

impl Future for CountdownFuture {
    type Output = &'static str;

    fn poll(mut self: Pin<&mut Self>, _cx: &mut Context<'_>) -> Poll<Self::Output> {
        if self.remaining == 0 {
            Poll::Ready(self.label)
        } else {
            self.remaining -= 1;
            Poll::Pending
        }
    }
}

async fn task(label: &'static str, ticks: u32) -> String {
    let result = CountdownFuture { remaining: ticks, label }.await;
    format!("{result} finished")
}

struct Executor {
    tasks: VecDeque<Pin<Box<dyn Future<Output = String>>>>,
}

impl Executor {
    fn new() -> Self {
        Executor { tasks: VecDeque::new() }
    }

    fn spawn(&mut self, future: impl Future<Output = String> + 'static) {
        self.tasks.push_back(Box::pin(future));
    }

    fn run(&mut self) {
        let waker = noop_waker();
        let mut cx = Context::from_waker(&waker);

        while let Some(mut fut) = self.tasks.pop_front() {
            match fut.as_mut().poll(&mut cx) {
                Poll::Ready(output) => println!("{output}"),
                Poll::Pending => self.tasks.push_back(fut),
            }
        }
    }
}

fn main() {
    let mut executor = Executor::new();
    executor.spawn(task("fast", 1));
    executor.spawn(task("slow", 3));
    executor.run();
}
