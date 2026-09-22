@enum TrafficLight begin
    Red
    Yellow
    Green
end

function next_light(light::TrafficLight)
    if light == Red
        return Green
    elseif light == Green
        return Yellow
    else
        return Red
    end
end

light = Red
for _ in 1:4
    println(light)
    global light = next_light(light)
end

println(Int(Green))
println(TrafficLight(1))
