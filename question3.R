seeds_orig = read.csv('seeds_dataset.csv', header=T)

rm_cols = which(colnames(seeds_orig) %in% c('seeID', 'seedType'))
print(rm_cols)

seeds = seeds_orig[,-rm_cols] #seeds without seeID and seedType columns

scseeds = scale(seeds) #scale seeds
print(class(scseeds)) #check the type of scseeds is a matrix

scseeds = as.data.frame(scseeds) #convert it to data frame

print(sapply(scseeds, mean)) #indeed the mean is 0, (very close to zero due to rounding errors) for every attribute 
print(sapply(scseeds, sd)) #indeed the standard deviation is 1 for every attribute


