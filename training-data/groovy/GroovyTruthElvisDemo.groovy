def values = [0, 1, "", "text", [], [1, 2], null, false, true]

for (v in values) {
    if (v) {
        println "${v} is truthy"
    } else {
        println "${v} is falsy"
    }
}

def name = ""
def displayName = name ?: "Anonymous"
println displayName

def count = null
count = count ?: 0
count += 1
println count
