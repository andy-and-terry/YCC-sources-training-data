public class OppWrapper implements Comparable {
    public Opportunity opp;
    public OppWrapper(Opportunity o) { opp = o; }
    public Integer compareTo(Object other) {
        OppWrapper o = (OppWrapper) other;
        if (opp.Amount == o.opp.Amount) return 0;
        return opp.Amount > o.opp.Amount ? -1 : 1;
    }
}
