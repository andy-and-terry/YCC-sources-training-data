module PigLatin
  def self.word(w)
    return "#{w}ay" if w.match?(/\A([aeiou]|xr|yt)/)

    m = w.match(/\A([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)\z/)
    m ? "#{m[2]}#{m[1]}ay" : "#{w}ay"
  end

  def self.translate(sentence)
    sentence.downcase.split.map { |w| word(w) }.join(" ")
  end
end

puts PigLatin.translate("quick fast run apple rhythm square")
