using CSV
using JuMP
using CPLEX
using DataFrames
using Random
#import Pkg;Pkg.add("CSV"); Pkg.add("JuMP");Pkg.add("CPLEX");Pkg.add("DataFrames");Pkg.add("Random");


include("functions.jl")

dataSet = "kidney"
dataFolder = "C:\\Users\\thibaut\\Documents\\Ponts_3A\\CNAM\\RODM\\data\\"
resultsFolder = "C:\\Users\\thibaut\\Documents\\Ponts_3A\\CNAM\\RODM\\res\\"

rawDataPath = dataFolder * dataSet * ".csv"
#println(isfile(rawDataPath))
#print(cd(readdir,dataFolder))

#modelTest= Model(with_optimizer(CPLEX.Optimizer))

train, test = createFeatures(dataFolder, dataSet)

dict_regles = createRules(dataSet, resultsFolder, train)
println("=============Règles trouvées==========")
#println("size rules",size(rules))
println("dict_regles",dict_regles)

timeLimitInSeconds = 300
#orderedRules = sortRules(dataSet, resultsFolder, train, rules, timeLimitInSeconds)
