public class CompositePattern {
    public interface OrgUnit {
        String getName();
        Integer getHeadcount();
    }

    public class Employee implements OrgUnit {
        private String name;

        public Employee(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }

        public Integer getHeadcount() {
            return 1;
        }
    }

    public class Department implements OrgUnit {
        private String name;
        private List<OrgUnit> members = new List<OrgUnit>();

        public Department(String name) {
            this.name = name;
        }

        public void addMember(OrgUnit unit) {
            members.add(unit);
        }

        public String getName() {
            return name;
        }

        public Integer getHeadcount() {
            Integer total = 0;
            for (OrgUnit unit : members) {
                total += unit.getHeadcount();
            }
            return total;
        }
    }

    public static void main() {
        Department engineering = new Department('Engineering');
        engineering.addMember(new Employee('Ada'));
        engineering.addMember(new Employee('Grace'));

        Department backend = new Department('Backend');
        backend.addMember(new Employee('Linus'));
        engineering.addMember(backend);

        System.debug(engineering.getName() + ' headcount: ' + engineering.getHeadcount());
    }
}
