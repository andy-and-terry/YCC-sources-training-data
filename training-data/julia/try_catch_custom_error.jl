struct MyErr <: Exception
    msg::String
end

try
    throw(MyErr("custom"))
catch e
    println(e isa MyErr ? e.msg : "other")
finally
    println("done")
end
