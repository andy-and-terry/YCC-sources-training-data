ages <- c(ann = 31, bob = 25, cy = 40)
print(ages)
print(names(ages))
print(ages["bob"])
print(ages[c("cy", "ann")])
ages[["dee"]] <- 22
print(sort(ages, decreasing = TRUE))
names(ages)[2] <- "robert"
print(ages)
print(unname(ages))
print(which.max(ages))
print(ages[ages > 25])
print("zed" %in% names(ages))
