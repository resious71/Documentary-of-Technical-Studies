##### TensorFlow 설치 (Tensorflow CPU vs GPU, CPU기반 설치)
# 2장 TensorFlow 환경구축
# 
# 2) GPU 기반 설치
#  - CPU와 설치 방식은 비슷하나 필요 유틸리티가 존재함 (NVIDIA만 지원..)
#  - 필요 유틸리티
#   . CUDA Toolkit
#   . cuDNN 
#  - 유틸리티 설치 후 환경변수 설정
#
#  가) CUDA Toolkit 설치  
#    - CUDA Toolkit 준비(https://developer.nvidia.com/cuda-downloads) 
#    - Tensorflow 지원 버전 확인 필요
#    - 설치파일과 패치를 모두 다운로드 받아서 설치해 준다.
#  나) cuDDN 설치
#    - cuDNN 다운로드 (https://developer.nvidia.com/cudnn)
#  다) 환경변수 설정
#    - 시작 --> 시스템 환경 변수 검색 --> 시스템 환경 변수 편집 선택
#    - PATH에 ~CUDA\vXX\bin 추가 
#    - CUDA_PATH, CUDA_PATH_HOME, CUDA_PATH_VX.X 추가 
#  라) TensorFlow GPU 설치
#    1. Anacoda Prompt 관리자 권한으로 실행
#    2. Python 버전 확인 
#       > python --version
#    3. 가상환경 생성
#       > conda create -n venv pip python=3.6
#    4. 가상환경 접속
#       > activate venv
#    5. tensorflow GPU 설치 
#       > pip install --ingnore-installed --upgrade tensorflow-gpu 
#    6. Jupyter Notebook 설치
#       > pip install jupyter
#    7. Jupyter Notebook 구동
#       > jupyter notebook           # 브라우저에서 Jupyter Notebook 실행
#   8. 정상 설치 확인
#      > python                     # 3.6 버전으로 실행
#      > import tensorflow as tf
#      > a = tf.constant(10)
#      > b = tf.constant(20)
#      > sess = tf.Session()
#      > sess.run(a+b)
#      > ^Z
#
##########################################
import tensorflow as tf
# Tensor 버전이 2.0 이상인 경우 ...
# Tensor 버전 확인 >>> tf.__version__
node1 = tf.constant(3.0, dtype=tf.float32)
node2 = tf.constant(4.0)

tf.print(node1,node2)
#########################################
