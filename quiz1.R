data = read.csv('points.csv')

d = dist(data, method='euclidean')

hc = hclust(d)

plot(hc)


#answer
print('correct answer is p1 and p3')
