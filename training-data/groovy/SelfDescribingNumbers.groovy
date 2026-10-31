boolean isSelfDescribing(String s) {
    s.toList().withIndex().every { d, i ->
        s.count(i.toString()) == Integer.parseInt(d)
    }
}

['1210', '2020', '21200', '1211'].each { println "$it ${isSelfDescribing(it)}" }
