def user = [profile: null]
println user.profile?.email
println user.profile?.email ?: 'none'
def s = null
println s?.length() ?: 0
println (s ?: 'default')
