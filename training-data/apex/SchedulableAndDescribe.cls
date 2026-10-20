global class SchedulableAndDescribe implements Schedulable {
    global void execute(SchedulableContext sc) {
        Schema.DescribeSObjectResult d = Account.SObjectType.getDescribe();
        Map<String, Schema.SObjectField> fields = d.fields.getMap();
        List<String> required = new List<String>();
        for (String name : fields.keySet()) {
            Schema.DescribeFieldResult f = fields.get(name).getDescribe();
            if (!f.isNillable() && f.isCreateable() && !f.isDefaultedOnCreate()) required.add(f.getName());
        }
        System.debug(d.getLabel() + ' requires ' + required);
    }

    public static Id scheduleNightly() {
        return System.schedule('Nightly describe', '0 0 2 * * ?', new SchedulableAndDescribe());
    }
}
