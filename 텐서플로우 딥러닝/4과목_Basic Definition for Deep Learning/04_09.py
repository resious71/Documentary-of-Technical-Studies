# 다중선형회귀분석 (실습 테스트)
#
# 1. 제공된 데이터를 바탕으로 Tensorflow를 활용하여 다중회귀모델을 적합해 보시오
#    (반복수 2000, NaN 값이 생성될 경우 learning_rate를 조정하여 진행하시오)
#
#    쪽지시험1 (X1) | 73  93  89  96  73  80
#     --------------------------------------------------------------
#    중간고사  (X2) | 80  88  91  98  66  71
#     --------------------------------------------------------------
#    쪽지시험2 (X3) | 75  93  90  100 70  95
#     --------------------------------------------------------------
#    기말고사  (Y)  | 76  92  90  98  71  83
#     --------------------------------------------------------------
#
import tensorflow as tf
from tensorflow.examples.tutorials.mnist import input_data

import matplotlib.pyplot as plt
import random

# Check out https://www.tensorflow.org/get_started/minst/beginners for
# more information about the mnist dataset
mnist= input_data.read_data_sets("./mnist/data/",one_hot=True)

nb_classes = 10

# MNIST data image of shape 28 * 28 = 784
X=tf.placeholder(tf.float32,[None, 784])
# 0 - 9 digits recognition = 10 classes
Y=tf.placeholder(tf.float32,[None, nb_classes])

W = tf.Variable(tf.random_normal([784, nb_classes]))
b = tf.Variable(tf.random_normal([nb_classes]))

# Hypotheis (using softmax)
hypothesis = tf.nn.softmax(tf.matmul(X, W) + b)
                
cost = tf.reduce_mean(-tf.reduce_sum(Y * tf.log(hypothesis), axis=1))
optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.1).minimize(cost)

# Test model
is_correct = tf.equal(tf.arg_max(hypothesis, 1), tf.arg_max(Y, 1))

# Calculate accuracy
accuracy = tf.reduce_mean(tf.cast(is_correct, tf.float32))

# parameters
training_epochs = 15
batch_size = 100

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    for epoch in range(training_epochs):
        avg_cost = 0
        total_batch = int(mnist.train.num_examples / batch_size)

        for i in range(total_batch):
            batch_xs, batch_ys = mnist.train.next_batch(batch_size)
            c, _ = sess.run([cost, optimizer], feed_dict={X: batch_xs, Y: batch_ys})
            avg_cost += c / total_batch

        print('Epoch:','%04d'%(epoch+1), 'cost=','{:.9f}'.format(avg_cost))

        # Test the model using test sets
        print("Accuracy: ", accuracy.eval(session=sess,
                                        feed_dict={X: mnist.test.images, Y: mnist.test.labels}))
# Get one and predict     
    r = random.randint(0, mnist.test.num_examples  - 1)
    print("Label", sess.run(tf.argmax(mnist.test.labels[r:r+1], 1)))
    print("Prediction:", sess.run(tf.argmax(hypothesis, 1),
                              feed_dict={X: mnist.test.images[r:r + 1]}))
    
    plt.imshow(mnist.test.images[r:r + 1].reshape(28, 28),
               cmap="Greys", interpolation='nearest')
    plt.show()


# 2. 제공된 데이터를 바탕으로 Tensorflow를 활용하여 다중회귀모델을 적합해 보시오
#    (반복수 2000, NaN 값이 생성될 경우 learning_rate를 조정하여 진행하시오)
#
#    적성검사 (X1)  | 65  50  55  65  55  70  65  70  65  70  50  55
#     --------------------------------------------------------------
#    결근횟수 (X2)  |  3   7   5   1   3   3   1   2   4   2   2   3  
#     --------------------------------------------------------------
#    엄무만족도 (Y) | 85  74  76  90  85  87  94  98  81  91  76  74  
#

import tensorflow as tf

#1. MNIST 데이터를 가져옵니다.
from tensorflow.examples.tutorials.mnist import input_data

# one_hot을 True로 설정하면 라벨을 one hot 벡터로 합니다. False이면 정수형 숫자가 라벨 됩니다.
# /tmp/data/ 폴더를 생성하고 MNIST 데이터 압축파일을 다운로드 받아 압축을 풀고 데이터를 넣습니다.
# 이후에는 다운로드 되어있는 압축파일의 압축을 풀어서 데이터를 읽어옵니다.

mnist= input_data.read_data_sets("/tmp/data/",one_hot=True)

#-- 2. 모델을 생성합니다.
# 모델의 입력을 받기 위해 플레이스홀더를 사용합니다.
# 첫번째 차원이 None인 이유는 데이터 개수 제약없이 입력 받기 위해서입니다.
# 두번째 차원이 784인 것은 MNIST의 이미지의 크기가 28 x 28 = 784  픽셀이기 때문입니다.
x = tf.placeholder(tf.float32,[None, 784])

# 모델 파라미터                  
W = tf.Variable(tf.zeros([784, 10]))
b = tf.Variable(tf.zeros([10]))

# softmax를 사용한 모델을 생성
# W, b 모델 파라미터 -> 변수
# x 이미지 데이터 입력 -> 플레이스홀더
y_model = tf.matmul(x, W) + b

#--- 3. loss와 optimizer를 정의합니다.
y = tf.placeholder(tf.float32, [None, 10])  # 크기 10인 MNIST의 라벨 데이터

# 크로스 엔트로피(cross entropy) 함수 공식을 그대로 사용하면 수치적으로 불안정하여 계산 오류 발생
# cost = tf.reduce_mean(-tf.reduce_sum(y*tf.log(tf.nn.softmax(y_model)),reduction_indices=1))
#
# 그래서 tf.nn.softmax_cross_entropy_with_logits_v2를 사용합니다. (tf.nn.softmax_cross_entropy_with_logits_v2)

# cross entropy를 손실 함수(cost function)로 사용
# cost = tf.reduce_mean(-tf.reduce_sum(y*tf.log(tf.nn.softmax(y_model)),reduction_indices=1))
cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(logits=y_model, labels=y))

# Gradient Descent - Backpropagation 기법으로 최적화
optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.01).minimize(cost)

#-- 4. 훈련을 위한 세션 제작
sess = tf.Session()
sess.run(tf.global_variables_initializer()) # 변수 초기화

for epoch in range(100): # 훈련을 25번 반복
    avg_cost = 0.

    # 1번 훈련시 전체 훈련 데이터를 사용하려면 100개씩 몇번 가져와야 하는지 계산하여 반복
    total_batch = int(mnist.train.num_examples / 100)
    for i in range(total_batch):
        # 전체 훈련 데이터(mnist.train)에서 100개씩 데이터를 가져옵니다.
        # (100, 784) (100, 10)
        batch_xs, batch_ys = mnist.train.next_batch(100)

        # optimizer와 cost 오퍼레이션을 실행합니다.
        _, c = sess.run([optimizer, cost], feed_dict={x: batch_xs, y: batch_ys})

        # 현재까지 평균 손실(loss)를 누적합니다.
        avg_cost += c / total_batch

    # 훈련 1번 끝날때 마다 중간 결과를 출력
    print('Epoch:','%04d'%(epoch+1), 'cost=','{:.9f}'.format(avg_cost))


print("최적화 완료")

#---- 5. 정확도 측정
# 라벨값 y와 모델로 계산된 값 y_model이 똑같이 같은 인덱스가 제일 크다고 하는지 검사
# ( tf.argmax 함수가 배열에서 가장 큰 값을 가리키는 인덱스를 리턴합니다.)
# 결과적으로 correct_prediction는 True 또는 False 값의 리스트를 가지게 됨
correct_prediction = tf.equal(tf.argmax(y_model, 1), tf.argmax(y, 1))


# tf.cast 함수를 사용하여 True 또는 False를 실수 1또는 0으로 변환
# 전체 데이터가 일치한다면 모든 값이 1이며 평균이 accuracy는 1이 되어야 합니다.
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

# 정확도 측정을 위해서 훈련 데이터(mnist.train) 대신에 별도의 테스트(mnist.test.images, mnist.test.labels)
print("Accuracy: ", sess.run(accuracy, feed_dict={x: mnist.test.images, y: mnist.test.labels}))

sess.close()
