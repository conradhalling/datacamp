import textanalysis.textanalysis

print("Counting the word 'cat' in the 'alice.txt' file...")
count = textanalysis.textanalysis.count_words("alice.txt", ["cat", "cats"])
print("Count:", count)
