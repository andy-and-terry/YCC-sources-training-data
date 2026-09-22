type
  LightState = enum
    lsRed, lsGreen, lsYellow

proc next(s: LightState): LightState =
  case s
  of lsRed: lsGreen
  of lsGreen: lsYellow
  of lsYellow: lsRed

proc name(s: LightState): string =
  case s
  of lsRed: "Red"
  of lsGreen: "Green"
  of lsYellow: "Yellow"

type
  TrafficLight = object
    state: LightState

proc change(t: var TrafficLight) =
  t.state = next(t.state)

var light = TrafficLight(state: lsRed)
for i in 0 ..< 4:
  echo name(light.state)
  change(light)
