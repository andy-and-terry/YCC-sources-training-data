Sub Main()
    Dim fruits As Variant, matches As Variant
    fruits = Array("apple", "apricot", "banana", "blueberry", "avocado")

    matches = Filter(fruits, "ap")
    Debug.Print "Contain 'ap': " & Join(matches, ", ")

    matches = Filter(fruits, "b", False)
    Debug.Print "Without 'b': " & Join(matches, ", ")

    Debug.Print "Count of a-words: " & (UBound(Filter(fruits, "a", True, vbTextCompare)) + 1)
    Debug.Print Join(Split("2024-06-15", "-"), "/")
    Debug.Print UBound(Split("a,b,,d", ",")) + 1 & " fields"
End Sub
