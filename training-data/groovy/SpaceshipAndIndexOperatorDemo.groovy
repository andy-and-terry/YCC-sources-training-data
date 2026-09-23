class Playlist implements Comparable<Playlist> {
    List<String> songs = []
    int rating

    int compareTo(Playlist other) {
        return rating <=> other.rating
    }

    String getAt(int index) {
        return songs[index]
    }

    void putAt(int index, String song) {
        songs[index] = song
    }

    Playlist leftShift(String song) {
        songs << song
        return this
    }
}

def a = new Playlist(rating: 3)
def b = new Playlist(rating: 5)

println a <=> b
println([a, b].sort()*.rating)

a << "Song One" << "Song Two"
println a[0]
a[1] = "Song Two Remix"
println a[1]
