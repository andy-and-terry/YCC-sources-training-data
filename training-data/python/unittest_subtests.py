import unittest


class T(unittest.TestCase):
    def test_even(self):
        for n in (2, 4, 6):
            with self.subTest(n=n):
                self.assertEqual(n % 2, 0)


if __name__ == "__main__":
    unittest.main()
