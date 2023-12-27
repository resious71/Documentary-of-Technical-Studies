##### TensorFlow 개념2 (변수, 플레이스 홀더)
# 3장 TensorFlow 기초
# 마. 변수
#  1) 개념
#   - 모델 학습 시 매개 변수(parameter)의 업데이트와 유지를 위해 사용 
#   - 알고리즘 학습 시 반복에 따라 값이 변하는 것을 표현하는 데이터 형
#   - 세션이 실행될 때, 변수는 고정된 상태를 유지한다
#   - 변수는 세션에서 실행 전 초기화 단계가 필요함
#  2) 예시
#   - tf.Variable() 함수를 이용하여 변수를 만들고, 어떤 값으로 초기화할지 정의
#   - 이후 tf.global_variables_initializer()를 이용하여 변수에 메모리를 할당하고 초기값을 설정
#     > init_val = tf.random_normal((1,5),0.1)   
#     > var = tf.Variable(init)_val, name='var')
#     > print("Before Session execute:\n".format(var))
#     > init=tf.global_variables_initializer()
#     > with tf.Session() as sess:
#     >    sess.run(init)
#     >    post_var = sess.run(var) 
#     > print("After Session execute:\n".format(post_var))
#
# 바. 플레이스 홀더
#  1) 개념
#   - 먼저 값을 만들고 나중에 값을 지정해 주는 자료형
#   - 변수의 타입을 미리 설정하고 나중에 필요한 변수를 받아 실행하는 것
#     (그래프를 미리 만들어 놓고 지연 실행하는 TensorFlow 방식을 활용하기 위한 변수)
#   - 신경망을 구현할 때 가장 어울리는 변수 설정방법
#   - shape 인수를 선택적으로 사용할 수 있다.  
#     > ph = tf.placeholder(tf.float32, shape(None, 10))
#   - 플레이스 홀더를 정의하면 반드시 입력값을 넣어줘야 하며, 세션을 실행 시킬 때
#     feed_dict{} 인자를 할당하여 입력값을 줄 수 있다. 
#     > sess.run(s, feed_dict={x:X_data, w:W_data})
#  2) 예시
#     > import tensorflow as tf
#     > a = tf.placeholder(tf.float32)
#     > b = tf.placeholder(tf.float32)
#     > sess = tf.Session()
#     > add_node = a + b          # tf.add와 같다
#     > print(sess.run(add_node, feed_dict={a:3, b:4.5}))
#     > print(sess.run(add_node, feed_dict={a:[1,3, b:2,4]}))
#
