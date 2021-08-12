using AdaGram
vm, dict = load_model("text8.bin")

println(expected_pi(vm, dict.word2id["new"]))
println(nearest_neighbors(vm, dict, "new", 1, 10))
println(nearest_neighbors(vm, dict, "new", 2, 10))
println(disambiguate(vm, dict, "new", split("york")))
println(disambiguate(vm, dict, "new", split("create")))