def root = File.createTempDir('walk', '')
new File(root, 'a/b').mkdirs()
new File(root, 'a/one.txt').text = 'one'
new File(root, 'a/b/two.log').text = 'two'
new File(root, 'three.txt').text = 'three'

def names = []
root.eachFileRecurse { f -> if (f.isFile()) names << f.name }
println names.sort()

println root.listFiles().findAll { it.isDirectory() }*.name
def sizes = [:]
root.eachFileRecurse(groovy.io.FileType.FILES) { sizes[it.name] = it.length() }
println sizes.sort()
println root.deleteDir()
