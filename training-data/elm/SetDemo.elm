module SetDemo exposing (commonTags, onlyInFirst, tagsA, tagsB, withNewTag)

import Set exposing (Set)


tagsA : Set String
tagsA =
    Set.fromList [ "red", "green", "blue" ]


tagsB : Set String
tagsB =
    Set.fromList [ "green", "blue", "yellow" ]


commonTags : Set String
commonTags =
    Set.intersect tagsA tagsB


onlyInFirst : Set String
onlyInFirst =
    Set.diff tagsA tagsB


withNewTag : String -> Set String -> Set String
withNewTag tag tags =
    Set.insert tag tags
