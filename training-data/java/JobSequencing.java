import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class JobSequencing {
    record Job(String id, int deadline, int profit) {}

    public static List<Job> schedule(Job[] jobs) {
        Job[] sorted = jobs.clone();
        Arrays.sort(sorted, Comparator.comparingInt(Job::profit).reversed());
        int maxD = Arrays.stream(jobs).mapToInt(Job::deadline).max().orElse(0);
        Job[] slots = new Job[maxD + 1];
        for (Job j : sorted) {
            for (int t = j.deadline(); t > 0; t--) {
                if (slots[t] == null) {
                    slots[t] = j;
                    break;
                }
            }
        }
        List<Job> out = new ArrayList<>();
        for (Job j : slots) if (j != null) out.add(j);
        return out;
    }

    public static void main(String[] args) {
        List<Job> s = schedule(new Job[] {new Job("a", 2, 100), new Job("b", 1, 19), new Job("c", 2, 27), new Job("d", 1, 25), new Job("e", 3, 15)});
        System.out.println(s.stream().map(Job::id).toList() + " profit=" + s.stream().mapToInt(Job::profit).sum());
    }
}
