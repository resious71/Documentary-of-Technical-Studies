# 다중선형회귀분석 (다변량 회귀분석의이해(머신러닝 실습))
# 1장. 딥러닝을 위한 머신러닝 이해
# 
#    1) Hypothesis using Matrix
#  
#     H(X) = w1x1 + w2x2 + w3x3 + ... + wkxk + (b)
#

import tensorflow as tf

x1_data = [19., 23., 26., 29., 30., 43., 44., 38., 55.]
x2_data = [16.6, 18.4, 17.1, 17.7, 18.2, 18.8, 19.2, 18.9, 19.5]
x3_data = [13., 10., 12., 10., 10., 7., 8., 9., 5.]

y_data = [33., 51., 40., 49., 50., 69., 70., 64., 89.]
# placeholders for a tensor that will be always fed.

x1 = tf.placeholder(tf.float32)
x2 = tf.placeholder(tf.float32)
x3 = tf.placeholder(tf.float32)
Y = tf.placeholder(tf.float32)

w1 = tf.Variable(tf.random_normal([1]), name='weight1')
w2 = tf.Variable(tf.random_normal([1]), name='weight2')
w3 = tf.Variable(tf.random_normal([1]), name='weight3')
b = tf.Variable(tf.random_normal([1]), name='bias')

hypotheiss = x1*w1 + x2*w2 + x3*w3 + b

#cost/loss function
cost = tf.reduce_mean(tf.square(hypotheiss-Y))

# Minimize, Need a very small learning rate for this data set
optimizer = tf.train.GradientDescentOptimzer(learning_rate=1e-5)
train = optimizer.minize(cost)

# Lanunch the graph in a session
sess = tf.Session()

# Initialize global variables in the graph
sess.run(tf.global_variables_initializer())
for step in range(200001):
    cost_val, hy_val = sess.run([cost, hypotheiss, train],
                                feed_dict={x1:x1_data, x2: x2_data, x3: x3_data, Y: y_data})
    if step % 10000 ==0:
        print(step, "Cost: ", cost_val, "\nPrediction:\n", hy_val)


############################ matrix

x_data = [[19, 16.6, 13.], [23., 18.4, 10.], [26., 17.1, 12],
          [29., 17.1, 10], [30., 18.2, 10], [43., 18.8, 7.], [44., 19.2, 8.],
          [38., 18.9, 9.], [55., 19.5, 5.]]

y_data = [[33.], [51.], [40.], [49.], [50.], [69.], [70.], [64.], [89.]]

X = tf.placeholder(tf.float32, shape=[None, 3])
Y = tf.placeholder(tf.float32, shape=[None, 1])

W = tf.Variable(tf.random_normal([3, 1]), name='weight')
b = tf.Variable(tf.random_normal([1]), name='bias')

hypothesis = tf.matmul(X,W) + b

#cost/loss function
cost = tf.reduce_mean(tf.square(hypotheiss-Y))

# Minimize, Need a very small learning rate for this data set
optimizer = tf.train.GradientDescentOptimzer(learning_rate=1e-5)
train = optimizer.minize(cost)

# Lanunch the graph in a session
sess = tf.Session()

# Initialize global variables in the graph
sess.run(tf.global_variables_initializer())
for step in range(200001):
    cost_val, hy_val = sess.run([cost, hypotheiss, train],
                                feed_dict={x1:x1_data, x2: x2_data, x3: x3_data, Y: y_data})
    if step % 10000 ==0:
        print(step, "Cost: ", cost_val, "\nPrediction:\n", hy_val)


################################ Loading data from file
#    ==> data-01-test-score.csv

import numpy as np

xy = np.loadtxt("data-01-test-score.csv", delimiter=',', dtype=np.float32)
x_data = xy[:, 0:-1]
y_data = xy[:, [-1]]

# Make sure the shape and data are OK

print(x_data.shape, x_data, len(x_data))
print(x_data.shape, x_data)

X = tf.placeholder(tf.float32, shape=[None, 3])
Y = tf.placeholder(tf.float32, shape=[None, 1])

W = tf.Variable(tf.random_normal([3, 1]), name='weight')
b = tf.Variable(tf.random_normal([1]), name='bias')

hypothesis = tf.matmul(X,W) + b

#cost/loss function
cost = tf.reduce_mean(tf.square(hypotheiss-Y))

# Minimize, Need a very small learning rate for this data set
optimizer = tf.train.GradientDescentOptimzer(learning_rate=1e-5)
train = optimizer.minize(cost)

# Lanunch the graph in a session
sess = tf.Session()

# Initialize global variables in the graph
sess.run(tf.global_variables_initializer())
for step in range(200001):
    cost_val, hy_val = sess.run([cost, hypotheiss, train],
                                feed_dict={x1:x1_data, x2: x2_data, x3: x3_data, Y: y_data})
    if step % 10000 ==0:
        print(step, "Cost: ", cost_val, "\nPrediction:\n", hy_val)
