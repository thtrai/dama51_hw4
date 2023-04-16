data = read.csv('points9.csv')

rownames(data) = c('p(2,4)','p(2,5)','p(1,3)','p(4,2)', 'p(4,1)')


print(dist(data,method='euclidean'))
print(dist(data,method='manhattan'))


print('Correct answer is p(2,4), p(2,5)')
