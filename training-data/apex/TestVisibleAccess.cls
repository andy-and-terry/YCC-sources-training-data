// @TestVisible exposes private members to test classes only, so production
// code keeps its encapsulation without making internals public.
public with sharing class TestVisibleAccess {

    @TestVisible
    private Integer discountPercent = 10;

    @TestVisible
    private static final Integer MAX_DISCOUNT = 50;

    public Decimal priceAfterDiscount(Decimal price) {
        Integer applied = clampDiscount(discountPercent);
        return price - (price * applied / 100);
    }

    @TestVisible
    private Integer clampDiscount(Integer requested) {
        if (requested < 0) {
            return 0;
        }
        return Math.min(requested, MAX_DISCOUNT);
    }
}

// A separate test class (its own file) can then call the private members:
//   TestVisibleAccess subject = new TestVisibleAccess();
//   System.assertEquals(50, subject.clampDiscount(90));
//   subject.discountPercent = 20;
//   System.assertEquals(80, subject.priceAfterDiscount(100));
