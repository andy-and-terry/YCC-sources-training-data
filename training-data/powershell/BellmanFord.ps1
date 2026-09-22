function Get-BellmanFord {
    param($Vertices, $Edges, [string]$Source)

    $dist = @{}
    foreach ($v in $Vertices) { $dist[$v] = [int]::MaxValue }
    $dist[$Source] = 0

    for ($i = 1; $i -lt $Vertices.Count; $i++) {
        foreach ($edge in $Edges) {
            $u, $v, $w = $edge
            if ($dist[$u] -ne [int]::MaxValue -and $dist[$u] + $w -lt $dist[$v]) {
                $dist[$v] = $dist[$u] + $w
            }
        }
    }

    foreach ($edge in $Edges) {
        $u, $v, $w = $edge
        if ($dist[$u] -ne [int]::MaxValue -and $dist[$u] + $w -lt $dist[$v]) {
            throw "graph contains a negative-weight cycle"
        }
    }

    return $dist
}

$vertices = @('a', 'b', 'c', 'd', 'e')
$edges = @(
    , @('a', 'b', -1)
    , @('a', 'c', 4)
    , @('b', 'c', 3)
    , @('b', 'd', 2)
    , @('b', 'e', 2)
    , @('d', 'b', 1)
    , @('d', 'c', 5)
    , @('e', 'd', -3)
)

$result = Get-BellmanFord -Vertices $vertices -Edges $edges -Source 'a'
foreach ($key in $vertices) { "$key`: $($result[$key])" }
