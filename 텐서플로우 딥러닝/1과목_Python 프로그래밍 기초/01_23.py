##### 객체와 클래스 (클래스를 구성하는 변수와 함수3)
# 2장 Python 프로그래밍
# 6.객체와 클래스
#  3) 객체와 클래스를 사용하는 이유
#   - 객체를 이용하려면 먼저 클래스를 선언해야 함
#   - 이런 번거로운 작업을 하는 이유는 코드 작성과 관리의 편리함을 추구하기 위함
#   - 작은 규모일 경우에는 굳이 필요 없을 수도 있으나 규모가 클 경우에는 반드시 필요
#   - 주로 게임 캐릭터나 유사한 객체가 많을 경우에 사용
#

biggy_name="B"
biggy_pos=0

def biggy_move():
    global biggy_pos
    biggy_pos = biggy_pos+1
    print("{0}의 모션은 {1}".format(biggy_name, biggy_pos))

biggy_move()

##### 

class Biggy():
    def __init__(self, name, pos):
        self.name = name
        self.pos = pos
        
    def move(self):
        self.pos = self.pos+1
        print("{0}의 모션은 {1}".format(self.name, self.pos))

biggy1=Biggy("B1", 2)
biggy2=Biggy("B2", 10)

biggy1.move()
biggy2.move()

#
#  4) 클래스 상속
#   - 이미 만들어진 클래스의 변수, 함수를 이어받아 새로운 내용만 추가하여 클래스를 선언하는 것
#   - 자식이 부모의 유전적 형질을 이어받는 관계와 유사하기 때문에 부모-자식 관계로 표현함
#   - 부모 클래스는 상위 클래스, 혹은 슈퍼 클래스라고 칭하며 자식 클래스는 부모 클래스의 속성(변수)와 
#     행위(함수)를 그대로 활용할 수 있음
#       + 부모 클래스 == 상위 클래스 == 슈퍼 클래스
#       + 자식 클래스 == 하위 클래스 == 서브 클래스 
#   - 부모 자식 클래스의 선언 방식
#     > class 자식 클래스 이름(부모 클래스 이름): 
#     >     <코드 블록>
#

class Car2():
    count = 0
    def __init__(self, wheel, color, num):
        self.wheel = wheel                                  # 인스턴스 변수
        self.color = color                                  # 인스턴스 변수
        self.count = num                                    # 인스턴스 변수
        Car2.count = Car2.count+1         # 클래스 변수
        print("Count of Car Ojbects:Car2.count={}".format(Car2.count))
        print("Count of Car Capa: self.count={}".format(self.count))
        
    def move(self, speed):
        self.speed=speed
        print("Car({0},{1}) is run with {2}".format(self.wheel, self.color, self.speed))

    def auto_curise(self):
        print("Auto curise mode")
        self.move(self.speed)
            
    @staticmethod
    def check_type(model_code):
        if(model_code >=20):
            print("electric car")
        elif(10 <= model_code < 20):
            print("gasoline car")
        else:
            print("disel car")
    
    @classmethod
    def instance_count(cls):
        print("instance count of cars :{}".format(cls.count))

class RoboticCar(Car2):
    def __init__(self, wheel, color, num, state):
        Car2.__init__(self, wheel, color, num)
        #super().__init__(wheel, color, num)
        self.state=state
    def robotic(self):
        self.state="Robotic"
        print("Car:unmmand, state={0}.format(self.state")
    def human(self):
        self.sate="Human"
        print("Car:manned, state{0}".format(self.state))

Robotic_car = RoboticCar(17, "white", 4, "Robotic")

Robotic_car = RoboticCar(17, "white", 4, "Robotic")
Robotic_car.robotic()
