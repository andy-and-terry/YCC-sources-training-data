import unittest


def divide(a, b):
    if b == 0:
        raise ZeroDivisionError("b must be non-zero")
    return a / b


class DivideTests(unittest.TestCase):
    def setUp(self):
        self.pairs = [(6, 3, 2), (1, 4, 0.25)]

    def test_values(self):
        for a, b, want in self.pairs:
            with self.subTest(a=a, b=b):
                self.assertEqual(divide(a, b), want)

    def test_zero(self):
        with self.assertRaises(ZeroDivisionError):
            divide(1, 0)

    @unittest.skipIf(False, "never skipped")
    def test_approx(self):
        self.assertAlmostEqual(divide(1, 3), 0.3333, places=3)


if __name__ == "__main__":
    unittest.main(argv=["x"], exit=False)
