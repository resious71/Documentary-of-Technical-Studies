##### 객체와 클래스 (클래스 선언과 객체 생성 2, 클래스를 구성하는 변수와 함수 1)
# 2장 Python 프로그래밍
# 6.객체와 클래스
# 가. 클래스 선언과 객체 생성
#  4) 객체 초기화
#    - 초기화함수 __init()__ 
#    - __init()__을 구현하면 객체를 생성하는 것과 속성값을 지정하는 것을 동시에 시행할 수 있음
#    - __init()__함수를 정의 후 객체를 생성할 때 아래와 같이 인자를 입력함
#        >> 객체명 = 클래스명(인자1, 인자2, 인자3, ..., 인자n) 
#    - __init()__함수를 통해 객체의 불변성을 확립하는 것이 좋음
#

class Car():
    def __init__(self, wheel, color):
        self.wheel=wheel
        self.color=color
    
    def move(self, speed):
        print("car: speed {} km to forward".format(speed))
    def turn(self, direction):
        print("car: turn {} ".format(direction))
    def stop(self):
        print("car({0},{1}): 정지".format(self.wheel, self.color))

my_car=Car(19, "white")
my_car.move(70)
my_car.turn("left")
my_car.stop()


# 나. 클래스를 구성하는 변수와 함수
#  1).클래스에서 사용하는 변수
#    - 변수의 위치에 따라 클래스 변수, 인스턴스 변수로 구분함    
#    - 클래스 변수는 해당 클래스를 사용하는 모든 객체가 공통으로 사용하는 것
#      클래스 내/외부에서 '클래스명.변수명' 형식으로 액세스 가능
#    - 인스턴스 변수는 클래스 내의 함수 안에서 'self.변수명 = data'형식으로 정의됨
#      각 객체 인스턴스마다 별도로 존재하며 관리되고 있음
#

class Car2():
    instance_count = 0
    def __init__(self, wheel, color):
        self.wheel = wheel                                  # 인스턴스 변수
        self.color = color                                  # 인스턴스 변수
        Car2.instance_count = Car2.instance_count+1         # 클래스 변수
        print("Count of Car Ojbects:{}".format(Car2.instance_count))

    def move(self, speed):
        print("car: speed {} km to forward".format(speed))
    def turn(self, direction):
        print("car: turn {} ".format(direction))
    def stop(self):
        print("car({0},{1}): 정지".format(self.wheel, self.color))        
        
car1 = Car2(16, "green")
car2 = Car2(16, "white")
car1.moves(30)
car2.moves(50)

class Car2():
    count = 0
    def __init__(self, wheel, color, num):
        self.wheel = wheel                                  # 인스턴스 변수
        self.color = color                                  # 인스턴스 변수
        self.count = num                                    # 인스턴스 변수
        Car2.count = Car2.count+1         # 클래스 변수
        print("Count of Car Ojbects:Car2.count={}".format(Car2.count))
        print("Count of Car Capa: self.count={}".format(self.count))

car1 = Car2(18, "red", 2)
car2 = Car2(20, "blue", 4)
