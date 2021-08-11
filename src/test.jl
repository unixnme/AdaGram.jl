using AdaGram
vm, dict = load_model("text8.bin")

println(expected_pi(vm, dict.word2id["bank"]))
println(nearest_neighbors(vm, dict, "bank", 1, 10))
println(disambiguate(vm, dict, "bank", split("river")))
println(disambiguate(vm, dict, "bank", split("money")))
