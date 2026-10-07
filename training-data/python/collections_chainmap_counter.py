from collections import ChainMap, Counter

defaults = {"color": "red", "size": "M"}
user = {"size": "L"}
settings = ChainMap(user, defaults)
print(settings["color"], settings["size"])
settings["theme"] = "dark"  # writes go to first map
print(user)

c = Counter("mississippi")
print(c.most_common(2))
c.subtract("ss")
print(c)
print(Counter(a=3, b=1) + Counter(a=1, b=2))
print(Counter(a=3, b=1) & Counter(a=1, b=2))
