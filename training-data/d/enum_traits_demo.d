import std.stdio;
import std.traits : EnumMembers;
import std.conv : to;

enum Planet { mercury, venus, earth, mars }

string describe(Planet p) {
    final switch (p) {
        case Planet.mercury: return "closest";
        case Planet.venus:   return "hottest";
        case Planet.earth:   return "home";
        case Planet.mars:    return "red";
    }
}

void main() {
    foreach (p; EnumMembers!Planet) {
        writeln(p, " (", cast(int) p, "): ", describe(p));
    }

    Planet p = "earth".to!Planet;
    writeln(p);
    writeln(Planet.mars.to!string);
    writeln(Planet.max, " ", Planet.min);
    writeln(EnumMembers!Planet.length);
}
