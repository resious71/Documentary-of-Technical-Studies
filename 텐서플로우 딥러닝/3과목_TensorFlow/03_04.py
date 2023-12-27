##### TensorFlow 개념1 (텐서, 그래프, 세션, 연산자)
# 3장 TensorFlow 기초
# 가. Tensor(텐서)
#  - TensorFlow의 기본 자료형
#  - 물리학에서 나온 개념으로 벡터와 유사하나 일반화된 개념
#  - 다차원 Array의 일반화 혹은 아무 차원이나 가질 수 있는 값들의 집합을 의미함
#  - Tensor는 기존의 Numpy에서 Array와 같게 생각해도 무방함
#  - 텐서는 Rank, Shape, Type 3가지 구성요소로 이루어져 있음
# 
#  가) Rank
#    - Numpy Array에서는 구조를 Dimension(차원)으로 표현 
#    - TensorFlow에서는 Rank라는 요어를 통해 구조를 표현함
#    - Rank의 형태
#  
#    Rank   |   Math entity                    |  Python example
#  -------------------------------------------------------------------------
#     0     | Scalar (magnitude only)          | s = 483
#     1     | Vector (magnitude and direction) | v = [1.1, 2.2, 3.3]
#     2     | Matrix (table of numbers)        | m = [[1,2,3],[4,5,6],[7,8,9]]
#     3     | 3-Tensor (cube of numbers)       | t=[[[2].[4],[6]]][[8],[10],[12]],[[14],[16],[18]]]
#     n     | n-Tensor (you get the idea)      | ...
#
#     . 0 rank tensor: 스칼라를 의미함
#     . 1 rank tensor: 1-D(1차원) 벡터와 같음
#     . 2 rank tensor: 2-D(2차원) 벡터와 같음#
#     . 3 rank tensor: 3-D(3차원) 벡터와 같음# 
#
#  나) Shape
#    - Tensor가 몇 개의 행과 열을 갖는지를 의미
#    - shape 형태
#
#    Rank   |   Shape             | Dimension number  |  example
#  -------------------------------------------------------------------------
#     0     | []                  | 0-D               | A 0-D tensor. A scalar 
#     1     | [D0]                | 1-D               | A 1-D tensor with shape[5]
#     2     | [D0, D1]            | 2-D               | A 2-D tensor with shape [3,4]
#     3     | [D0, D1, D2]        | 3-D               | A 3-D tensor with shape [1,4,3]
#     n     | [D0, D1, ...Dn-1]   | n-D               | A tensor with shape [D0, D1, ...Dn-1]
#
#  다) Types
#    - Tensor의 값이 어떤 타입인지를 의미
#    - Type의 형태
#
#    Data Type name   |  Python Data type  |  Description 
#  --------------------------------------------------------------------------
#      DT_FLOAT       |  tf.float32        | 32비트 부동소수점 숫자    
#      DT_DOUBLE      |  tf.float64        | 64비트 부동소수점 숫자
#      DT_INT8        |  tf.int8           | 8비트 정수
#      DT_INT16       |  tf.int16          | 16비트 정수
#      DT_INT32       |  tf.int32          | 32비트 정수
#      DT_INT64       |  tf.int64          | 64비트 정수 
#      DT_UNIT8       |  tf.uint8          | 8비트 부호 없는 정수
#      DT_UNIT16      |  tf.uint16         | 16비트 부호 없는 정수
#      DT_STRING      |  tf.string         | 가변 길이 바이트 배열
#      DT_BOOL        |  tf.bool           | 참 거짓 값
#      DT_COMPLEX64   |  tf.complex64      | 2개의 32비트 부동소수점 숫자로 구성된 복소수
#      DT_COMPLEX128  |  tf.complex128     | 2개의 64비트 부동소수점 숫자로 구성된 복소수
#      DT_QINT8       |  tf.qint8          | 양자화 연산에 사용되는 8비트 정수
#      DT_QINT32      |  tf.qint32         | 양자화 연산에 사용되는 32비트 정수
#      DT_QUNIT8      |  tf.quint8         | 양자화 연산에 사용되는 8비트 부호 없는 정수
#
# 나. Graph(그래프)
#  1) 개념
#   - TensorFlow는 그래프 구조를 통해 데이터를 분석함
#   - 그래프 구조는 노드(Node)와 엣지(Edge)로 구성된 구조
#   - Data Flow Graph Computation이라고 불리며 노드에 지정된 연산을 시행하는 구조로 이루어져 있다.   
#   - 여기서 엣지는 Tensor를 의미하며 노드는 곱하고 나누는 등 연산을 의미
#   - 노드 > 연산, 엣지 > 텐서s
#
#  2) 예시
#  import tensorflow as tf
#  a=tf.constant(5, name='a')     # a에 숫자 5 입력
#  b=tf.constant(3, name='b')     # b에 숫자 3 입력
#  c=tf.multiply(a,b, name='c')    # a와 b의 곱
#  d=tf.add(a,b, name='d')        # a와 b의 합
#  e=tf.add(c,d, name='e')        # c와 d의 합 
#  sess = tf.Session()
#  print(sess.run(e))
#
# 다. Session(세션)
#  1) 개념
#   - 그래프 전체 또는 일부를 실행하여 계산 결과를 출력해주는 것
#   - TensorFlow의 오퍼레이션, 즉 노드를 실행하기 위한 클래스임
#   - 객체를 실행하거나 그 값을 구하기 위한 주요 메커니즘
#   - 연산을 시행하기 위한 단계
#  2) 예시
#   - sess= tf.Session()으로 정의해주고, sess.run으로 이를 실행해 볼 수 있다.
#   - 연산이 끝난 이후에 sess.close()를 이용해 세션을 닫아주는 것이 좋다
#     > import tensorflow as tf
#     > tensor_a = tf.constant(100, name='a')
#     > print(tensor_a)         # a의 값이 출력되지 않는다
#     # 세션을 새엇앟여 run 메소드를 사용해야 텐서의 값이 정해진다 
#     > sess1 = tf.Session()
#     > print(sess1.run(tensor_a))
#     > sess1.close()
# 
# 라. 연산자
#   - 생성된 데이터를 덧셈, 뺄셈 등의 산술 연산을 위한 매개변수
# 
#      Operator             |  축약형
#   --------------------------------------
#    tf.add()               |  a + b
#    tf.multiply()          |  a * b
#    tf.subtract()          |  a - b
#    tf.divide()            |  a / b
#    tf.pow()               |  a ** b
#    tf.mod()               |  a % b
#    tf.logical_and()       |  a & b
#    tf.greater()           |  a > b
#

