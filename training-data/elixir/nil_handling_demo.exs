user = %{profile: %{email: nil}}

IO.inspect(user[:profile][:email])
IO.inspect(user[:missing][:x])
IO.inspect(get_in(user, [:profile, :email]))
IO.inspect(user.profile.email || "none")
IO.inspect(nil && :never)
IO.inspect(false || nil || :fallback)
IO.inspect(is_nil(nil))
IO.inspect(not is_nil(0))
IO.inspect(if(nil, do: 1, else: 2))
