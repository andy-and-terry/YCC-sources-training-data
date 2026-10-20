import java.util.*;

public class CloneableDeepCopy {
    static class Doc implements Cloneable {
        String title; List<String> tags = new ArrayList<>();
        Doc(String t) { title = t; }
        @Override public Doc clone() {
            try { Doc d = (Doc) super.clone(); d.tags = new ArrayList<>(tags); return d; }
            catch (CloneNotSupportedException e) { throw new AssertionError(e); }
        }
    }

    public static void main(String[] args) {
        Doc a = new Doc("t"); a.tags.add("x");
        Doc b = a.clone(); b.tags.add("y");
        System.out.println(a.tags + " " + b.tags);
    }
}
