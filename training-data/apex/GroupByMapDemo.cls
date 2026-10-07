public class GroupByMapDemo {
    public class Employee {
        public String name;
        public String dept;
        public Decimal salary;

        public Employee(String name, String dept, Decimal salary) {
            this.name = name;
            this.dept = dept;
            this.salary = salary;
        }
    }

    public static Map<String, List<Employee>> groupByDept(List<Employee> emps) {
        Map<String, List<Employee>> result = new Map<String, List<Employee>>();
        for (Employee e : emps) {
            if (!result.containsKey(e.dept)) {
                result.put(e.dept, new List<Employee>());
            }
            result.get(e.dept).add(e);
        }
        return result;
    }

    public static void main() {
        List<Employee> emps = new List<Employee>{
            new Employee('Ann', 'Sales', 5000),
            new Employee('Bob', 'Eng', 7000),
            new Employee('Cy', 'Sales', 5500),
            new Employee('Di', 'Eng', 8000)
        };
        Map<String, List<Employee>> grouped = groupByDept(emps);
        for (String dept : new List<String>(grouped.keySet())) {
            Decimal total = 0;
            for (Employee e : grouped.get(dept)) {
                total += e.salary;
            }
            System.debug(dept + ': ' + grouped.get(dept).size() + ' employees, avg ' + total / grouped.get(dept).size());
        }
    }
}
