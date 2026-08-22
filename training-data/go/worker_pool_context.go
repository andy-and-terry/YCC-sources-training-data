package main

import (
	"context"
	"fmt"
	"sync"
	"time"
)

type Job struct {
	ID int
}

type Result struct {
	JobID int
	Value int
	Err   error
}

func worker(ctx context.Context, id int, jobs <-chan Job, results chan<- Result, wg *sync.WaitGroup) {
	defer wg.Done()
	for {
		select {
		case <-ctx.Done():
			return
		case job, ok := <-jobs:
			if !ok {
				return
			}
			select {
			case <-ctx.Done():
				return
			case results <- process(job):
			}
		}
	}
}

func process(job Job) Result {
	time.Sleep(10 * time.Millisecond)
	return Result{JobID: job.ID, Value: job.ID * job.ID}
}

func RunPool(ctx context.Context, numWorkers, numJobs int) []Result {
	jobs := make(chan Job, numJobs)
	results := make(chan Result, numJobs)
	var wg sync.WaitGroup

	for w := 0; w < numWorkers; w++ {
		wg.Add(1)
		go worker(ctx, w, jobs, results, &wg)
	}

	for i := 0; i < numJobs; i++ {
		jobs <- Job{ID: i}
	}
	close(jobs)

	go func() {
		wg.Wait()
		close(results)
	}()

	var collected []Result
	for r := range results {
		collected = append(collected, r)
	}
	return collected
}

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()

	results := RunPool(ctx, 4, 20)
	fmt.Printf("processed %d jobs\n", len(results))
}
