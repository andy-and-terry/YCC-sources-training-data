@IsTest
private class SystemAssertVariants {
    // Test helper showing the assertion family. Each call throws an
    // AssertException with the supplied message when it fails.
    @IsTest
    static void assertionFamily() {
        Integer total = 2 + 3;
        List<String> names = new List<String>{ 'a', 'b' };

        System.assertEquals(5, total, 'sum should be 5');
        System.assertNotEquals(6, total, 'sum should not be 6');
        System.assert(names.size() == 2, 'two names expected');

        // Newer Assert class gives more descriptive failures
        Assert.areEqual(5, total);
        Assert.isTrue(names.contains('a'));
        Assert.isFalse(names.isEmpty());
        Assert.isNotNull(names);
        Assert.isInstanceOfType(names, List<String>.class);

        // Verify an expected failure
        try {
            Assert.fail('forced failure');
        } catch (AssertException e) {
            System.debug('Caught: ' + e.getMessage());
        }
    }
}
