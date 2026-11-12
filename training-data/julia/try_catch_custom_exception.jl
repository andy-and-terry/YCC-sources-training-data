struct MyErr <: Exception; msg::String; end
Base.showerror(io::IO, e::MyErr) = print(io, "MyErr: ", e.msg)
try
    throw(MyErr("bad"))
catch e
    println(e isa MyErr, " ", e.msg)
finally
    println("cleanup")
end
