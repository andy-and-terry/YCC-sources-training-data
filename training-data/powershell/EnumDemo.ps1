enum TrafficLightColor {
    Red
    Yellow
    Green
}

function NextColor {
    param([TrafficLightColor]$Color)
    switch ($Color) {
        ([TrafficLightColor]::Red)    { return [TrafficLightColor]::Green }
        ([TrafficLightColor]::Green)  { return [TrafficLightColor]::Yellow }
        ([TrafficLightColor]::Yellow) { return [TrafficLightColor]::Red }
    }
    return $Color
}

$current = [TrafficLightColor]::Red
for ($i = 0; $i -lt 4; $i++) {
    Write-Output $current
    $current = NextColor -Color $current
}
