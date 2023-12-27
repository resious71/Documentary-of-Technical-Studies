##### TensorFlow 설치 (Tensorflow CPU vs GPU, CPU기반 설치)
# 2장 TensorFlow 환경구축
# 가. TensorFlow 설치 ?
#   - Python 기반에서 설치 가능
#   - TensorFlow는 PC 환경에 따라 CPU/GPU 버전 중 선택하여 설치 가능
#   - GPU 버전의 경우 NVIDIA사의 그래픽 드라이버만 지원
#   - 64bit 운영체제 환경에서 설치 가능하며, Ubuntu 16.04이상 macOS 10.12.6 이상, 윈도우 7이상에서 설치 가능
#
#  1) CPU vs GPU
#   - TensorFlow는 CPU와 GPU 두 가지 환경으로 구축 가능
#   - 연산 방식이 달라 각자의 차이점이 있음
#     . CPU에 비해 GPU가 코어 수가 많다
#     . CPU는 복잡한 계산을 빠르게 처리 할 수 있으나 직렬처리 방법이다
#     . GPU는 간단한 계산을 빠르게 처리할 수 있고, 병렬처리 방법을 사용하여 동시에 여러 계산이 가능
#
#   - CPU와 GPU 구조 비교
#     . CPU = DRAN + Cache + ALUs + Control
#     . GPU = DRAN + ((Control + Cache) + ALUs)s
#     . 내부에서 연산을 담당하는 산출연산처리(ALU)를 이용 명령어를 해석, 실행하게 되는데 
#       CPU는 직렬방식으로 처리, GPU는 병렬 방식으로 여러 개를 한번에 실행 할 수 있음
#   - CPU와 GPU의 연산방법
#     . CPU: Core가 순차적으로 하나씩 연산
#     . GPU: 다수의 Core가 한번에 병렬로 처리
#
#
# 1) CPU 기반 설치
#   - TensorFlow를 설치하기 위해 우선 Python이 설치되어 있어야 함
#   - Python 최신 버전에서는 TensorFlow가 구동되지 않아 Python 3.6이하 버전이 필요함
#   - 기존 설치한 anaconda를 통해 TensorFlow 설치
#     . Anaconda Prompt 실행 후 다음 코드 실행
#        python --version                     # 파이썬 버전 확인 
#        conda create -n venv pip pyton=3.6   # 파이썬 버전 3.6으로 가상환경 설정  
#        activate venv                        # 가상환경 접속
#        pip install tensorflow               # TensorFlow 설치
#        pip install jupyter                  # jupyter notebook 설치
#
#    . TensorFlow 구동 여부를 확인하기 위한 작업 
#       # python or jupyter notebook 실행
#       import tensorflow as tf 
#       a = tf.constant(10)
#       b = tf.constant(20)
#       sess = tf.Session()
#       sess.run(a+b)  
#
# 실습
# 1. Anacoda Prompt 관리자 권한으로 실행
# 2. Python 버전 확인 
#    > python --version
# 3. 가상환경 생성
#    > conda create -n tensorflowcpu python=3.6
# 4. 가상환경 접속
#    > activate tensorflowcpu     #(base) --> (tensorflowcpu)
# 5. tensorflow 설치 
#    > pip install tensorflow

###########################################
# 환경 설정
HTTP_PROXY = http:// xxxxx
HTTPS_PROXY = http:// xxxxx
REQUESTS_CA_UNDLE=C:/../../../XXX.crt
###########################################
# 6. 정상 설치 확인
#    > python                     # 3.6 버전으로 실행
#    > import tensorflow as tf
#    > a = tf.constant(10)
#    > b = tf.constant(20)
#    > sess = tf.Session()
#    > sess.run(a+b)
#    > ^Z

##########################################
import tensorflow as tf
# Tensor 버전이 2.0 이상인 경우 ...
# Tensor 버전 확인 >>> tf.__version__
node1 = tf.constant(3.0, dtype=tf.float32)
node2 = tf.constant(4.0)

tf.print(node1,node2)
#########################################

# 7. Jupyter Notebook 설치
#    > pip install jupyter
# 8. Jupyter Notebook 구동
#    > jupyter notebook           # 브라우저에서 Jupyter Notebook 실행
# 9. 6번의 샘플 코드를 Jupyter Notebook에서 실행   
#
