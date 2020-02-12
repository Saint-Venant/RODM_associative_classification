using CSV
using JuMP
using CPLEX
using DataFrames
using Random
#import Pkg;Pkg.add("CSV"); Pkg.add("JuMP");Pkg.add("CPLEX");Pkg.add("DataFrames");Pkg.add("Random");


include("functions.jl")

dataSet = "kidney"
dataFolder = "../data/"
resultsFolder = "../res/"

rawDataPath = dataFolder * dataSet * ".csv"
#println(isfile(rawDataPath))
#print(cd(readdir,dataFolder))

#modelTest= Model(with_optimizer(CPLEX.Optimizer))
println("début prgm")
train, test = createFeatures(dataFolder, dataSet)

rulesMain = createRules(dataSet, resultsFolder, train)
println("=============Règles trouvées==========")
#println("rulesMain",rulesMain)

println("=============Début Tri==========")
timeLimitInSeconds = 300
orderedRules = sortRules(dataSet, resultsFolder, train, rulesMain, timeLimitInSeconds)
println("=============Fin Tri==========")

println("-- Train results")
showStatistics(orderedRules, train)
println("-- Test results")
showStatistics(orderedRules, test)

println("ordered rules :\n", orderedRules)
