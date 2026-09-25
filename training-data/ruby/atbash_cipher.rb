def atbash(s) = s.tr('a-zA-Z', 'zyxwvutsrqponmlkjihgfedcbaZYXWVUTSRQPONMLKJIHGFEDCBA')

enc = atbash('Hello, World!')
puts "#{enc} | #{atbash(enc)}"
