scores <- c(75, 82, 60, 95, 40)
if (all(scores >= 60)) {
  print("all students passed")
}
if (any(scores < 60)) {
  print("at least one student failed")
}
