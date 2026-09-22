module SetOperationsDemo exposing (commonTags, onlyInFirst, uniqueTags)

import Set exposing (Set)


uniqueTags : List String -> Set String
uniqueTags tags =
    Set.fromList tags


commonTags : List String -> List String -> Set String
commonTags a b =
    Set.intersect (Set.fromList a) (Set.fromList b)


onlyInFirst : List String -> List String -> Set String
onlyInFirst a b =
    Set.diff (Set.fromList a) (Set.fromList b)
