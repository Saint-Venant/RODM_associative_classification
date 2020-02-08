using CSV
using JuMP
using CPLEX
using DataFrames
using Random

include("functions.jl")

dataSet = "kidney"
dataFolder = "../data/"
resultsFolder = "../res/"


train, test = createFeatures(dataFolder, dataSet)

rules = createRules(dataSet, resultsFolder, train)
