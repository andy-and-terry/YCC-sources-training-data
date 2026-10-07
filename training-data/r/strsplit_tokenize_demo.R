# Basic text tokenizing: strsplit, tolower, gsub and frequency counting.
text <- "The quick brown fox. The lazy dog! Is the fox quick?"

clean <- tolower(gsub("[[:punct:]]", "", text))
words <- strsplit(clean, "\\s+")[[1]]
print(words)

freq <- sort(table(words), decreasing = TRUE)
print(head(freq, 3))

sentences <- strsplit(text, "(?<=[.!?])\\s+", perl = TRUE)[[1]]
print(sentences)
print(nchar(sentences))

print(unlist(lapply(strsplit(c("a=1", "b=2"), "="), `[`, 2)))
