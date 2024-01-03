##### 객체와 클래스 (클래스 선언과 객체 생성 1)
# 2장 Python 프로그래밍
# 6.객체와 클래스
# 가. 클래스 선언과 객체 생성
#  1) 객체
#    - 객체를 만들고 이용할 수 있는 기능을 제공하는 프로그래밍 언어를 객체지향 언어라고 칭함
#    - 속성(상태, 특징)과 해우이(행동, 동작, 기능)로 굿어된 것
#    - 객체의 특징인 속성은 변수, 행동은 함수로 구현 - 객체는 변수와 함수의 묶음 
#  2) 클래스 선언
#    - 객체를 만들기 위해 먼저 클래스를 선언해야 함
#    - 클래스는 객체의 공통된 속성과 행위를 변수와 함께 함수로 정의한 것
#    - 클래스 선언을 위한 기본 구조
#     >  class 클래스명():
#          [변수1]
#          [변수2]
#           ...
#          def 함수1(self[, 인자1, 인자2, ... 인자n]):
#              <코드 블록>   
#               ....  
#          def 함수1(self[, 인자1, 인자2, ... 인자n]):
#              <코드 블록>   
#               ....  #
#

class Car():
    pass

my_car = Car()
my_car

#  3) 객체 생성 및 활용
#   - 선언된 클래스로부터 클래스의 인스턴스인 객체를 생성
#      > 객체명 = 클래스명()
#   - 객체에 속성을 설정
#      > 객체명.변수명 = 속성값
#   - 객체의 변수에 접근해서 객체의 속성을 가져오는 방법
#      > 객체명.변수명
#   - 객체의 메서드를 호출하는 방법
#      > 객체명.메서드명[(인자1, 인자2, ..., 인자n)]
#

my_car.wheel_size=16
my_car.color = "black"

print("Wheel size :", my_car.wheel_size)
print("Color :", my_car.color)

class Car():
    def move(self, speed):
        print("car: speed {} km to forward".format(speed))
    def turn(self, direction):
        print("car: turn {} ".format(direction))
    def stop(self):
        print("car({0},{1}): 정지".format(self.wheel, self.color))

my_car = Car()
my_car.wheel = 18
my_car.color = "red"

my_car.move(40)
my_car.turn("left")
my_car.stop()

your_car = Car()
your_car.wheel = 20
your_car.color = "black"
your_car.move(60)
your_car.turn("right")
your_car.stop()
