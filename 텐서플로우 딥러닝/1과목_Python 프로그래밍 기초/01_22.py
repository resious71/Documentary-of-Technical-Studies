##### 객체와 클래스 (클래스를 구성하는 변수와 함수 2)
# 2장 Python 프로그래밍
# 6.객체와 클래스
#  2) 클래스에서 사용하는 함수
#   - 클래스에서 정의하는 함수(메서드)는 그 기능과 사용법에 따라 인스턴스 메서드, 정적 메서드,
#     클래스 메서드 3가지로 분류됨
#   - 인스턴스 메서드
#     + 각 객체에서 개별적으로 동작하는 함수를 만들고자 할 때 사용하는 함수로 함수를 정의할 때 첫 인자로 self가 필요함
#       > class 클래스명():
#       >    def 함수명(self[, 인자1, 인자2, ... , 인자n])
#       >        self.변수명1 = 인자1
#       >        self.변수명2 = 인자2
#       >        self.변수명3 = 데이터
#       >        ...  
#       >        <코드 블록>
#   - 아래와 같이 객체 생성 후 호출할 수 있음
#       > 객체명 = 클래스명()
#       > 객체명.메서드명([인자1, 인자2, ..., 인자n])
#   - 정적 메서드
#     + 날짜 및 시간 정보 제공, 단위 변환 등과 같이 객체와 관계없이 독립적으로 동작하는 함수를 만들 때 주로 이용함
#       > class 클래스명():
#       >    @staticmethod
#       >    def 함수명 ([인자1, 인자2, ... , 인자n])
#   - 객체를 생성한 후에 정적 메서드를 호출할 수 있지만 아래와 같이 보통 객체를 생성하지 않고 클래스명을 이용하여 호출함
#       > 클래스명.메서드명([인자1, 인자2, ..., 인자n])
#

# /// 인스턴스 메서드
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

car1 = Car2(19, "white", 2)
car1.move(80)
car1.auto_curise()

car2=Car2(20, "red", 4)
car2.move(100)
car2.auto_curise()

# /// 정적 메서드

class Car2():
    
    @staticmethod
    def check_type(model_code):
        if(model_code >=20):
            print("electric car")
        elif(10 <= model_code < 20):
            print("gasoline car")
        else:
            print("disel car")
            
Car2.check_type(25)

# /// 클래스 메서드

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
        
Car2.instance_count()     
car1=Car2(19,"white",2)
Car2.instance_count()  
Car2.instance_count()     
car2=Car2(20,"white",4)
Car2.instance_count()  

