const VOWEL_START = r"^([aeiou]|xr|yt)"
const CONSONANT = r"^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$"

function pig_word(w::AbstractString)
    occursin(VOWEL_START, w) && return w * "ay"
    m = match(CONSONANT, w)
    return m === nothing ? w * "ay" : m[2] * m[1] * "ay"
end

translate(s) = join(pig_word.(split(lowercase(s))), " ")

println(translate("quick fast run apple rhythm square"))
