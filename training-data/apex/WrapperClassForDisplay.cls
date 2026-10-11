public class WrapperClassForDisplay {
    public class AccountRow {
        public Account record { get; private set; }
        public Boolean selected { get; set; }
        public String display {
            get { return record.Name + (selected ? ' (selected)' : ''); }
        }

        public AccountRow(Account record) {
            this.record = record;
            this.selected = false;
        }
    }

    public static void main() {
        AccountRow row = new AccountRow(new Account(Name = 'Globex'));
        System.debug(row.display);
        row.selected = true;
        System.debug(row.display);
    }
}
