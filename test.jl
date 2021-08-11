using AdaGram
vm, dict = load_model("text8.bin")

println(expected_pi(vm, dict.word2id["apple"]))
println(nearest_neighbors(vm, dict, "apple", 1, 10))
println(nearest_neighbors(vm, dict, "apple", 2, 10))
println(disambiguate(vm, dict, "apple", split("computer")))
println(disambiguate(vm, dict, "apple", split("fruit")))
