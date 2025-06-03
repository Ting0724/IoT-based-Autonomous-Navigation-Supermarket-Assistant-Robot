import RPi.GPIO as GPIO
import threading
import multiprocessing
from gpiozero import Button, Buzzer, DistanceSensor
from time import sleep
from mfrc522 import SimpleMFRC522
import sys
import socket
import pigpio
from gpiozero import DistanceSensor
import signal

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

ultrasonic = DistanceSensor(echo=17, trigger=4)
# Motor 1
M1_R_PWM = 19
M1_L_PWM = 26
M1_R_EN = 20
M1_L_EN = 21

# Motor 2
M2_R_PWM = 13
M2_L_PWM = 6
M2_R_EN = 12
M2_L_EN = 16

IRsensor1 = 0
IRsensor2 = 5
IRsensorMid1 = 23
IRsensorMid2 = 24

#GPIO.setup(M1_R_PWM, GPIO.OUT)
#GPIO.setup(M1_L_PWM, GPIO.OUT)
GPIO.setup(M1_L_EN, GPIO.OUT)
GPIO.setup(M1_R_EN, GPIO.OUT)
#GPIO.setup(M2_R_PWM, GPIO.OUT)
#GPIO.setup(M2_L_PWM, GPIO.OUT)
GPIO.setup(M2_L_EN, GPIO.OUT)
GPIO.setup(M2_R_EN, GPIO.OUT)

GPIO.output(M1_L_EN, True)
GPIO.output(M1_R_EN, True)
GPIO.output(M2_L_EN, True)
GPIO.output(M2_R_EN, True)

GPIO.setup(IRsensor1, GPIO.IN)
GPIO.setup(IRsensor2, GPIO.IN)
GPIO.setup(IRsensorMid1, GPIO.IN)
GPIO.setup(IRsensorMid2, GPIO.IN)

# Initialize pigpio
pi = pigpio.pi()
if not pi.connected:
    exit()

# ---------------------------------------------------------------
helpbutton = 27

GPIO.setup(helpbutton, GPIO.IN) 
 
buzzer = Buzzer(22)

reader = SimpleMFRC522()

# ---------------------------------------------------------------
IP_address = "192.168.73.19"
RFID_EN = '0'
motor_action = '0'
destination_row = 0
destination_col = 0
destination_rack = '0'
current_row = 0
current_col = 0
direction = 'front'

motor_speed = 80
rotate_speed = 80

check = 0
Step = 1
buzzer_run = 0

def TCPIP_RFID_EN():
    global RFID_EN
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_ip = IP_address  # replace with the server's IP address
    server_port = 2100  # replace with the server's port number
    client.connect((server_ip, server_port))
    while True:
        response = client.recv(1024)
        response = response.decode("utf-8")
        if response.lower() == "closed":
            break
        print(f"Received: {response}")
        RFID_EN = response
    client.close()

def TCPIP_RFID_Check(item_id):
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_ip = IP_address 
    server_port = 2020  
    client.connect((server_ip, server_port))
    client.send(item_id.encode("utf-8")[:1024])
    client.close()

def TCPIP_RFID_Purchase(item_id):
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_ip = IP_address 
    server_port = 2040  
    client.connect((server_ip, server_port))
    client.send(item_id.encode("utf-8")[:1024])
    client.close()

# Define a handler for the alarm signal
def alarm_handler(signum, frame):
    raise TimeoutError("Input timed out")

signal.signal(signal.SIGALRM, alarm_handler)

def RFID_Read():
    try:
        signal.alarm(1)
        Emergency_button()
        print("Hold a tag near the reader")
        id, item_id = reader.read()
        if RFID_EN == '1':
            buzzer.beep(0.1, 0.1, 1)
            print("ID: %s\nItem ID: %s" % (id,item_id))
            TCPIP_RFID_Check(item_id)
            TCPIP_RFID_Purchase(item_id)
            sleep(1)
        signal.alarm(0)
    except TimeoutError:
        print("No input received within the time limit")

def Emergency_button():
    if GPIO.input(helpbutton) == True:
        print("Button is pressed")
        sendmsg = '1'
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_ip = IP_address 
        server_port = 2120  
        client.connect((server_ip, server_port))
        client.send(sendmsg.encode("utf-8")[:1024])
        while GPIO.input(helpbutton):
            sendmsg = '0'
            client.send(sendmsg.encode("utf-8")[:1024])
        client.close()

#-----------------------------------------------------------------------
# Motor Function Start Here
def Item_Coordinate():
    global destination_row, destination_col, motor_action
    while True:
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_ip = IP_address
        server_port = 2000 
        client.connect((server_ip, server_port))
        print('Waiting incoming data')
        response = client.recv(1024)
        response = response.decode("utf-8")
        if response.lower() == "closed":
            pass
        print(f"Received: {response}")
        destination_row = int(response[2])
        destination_col = int(response[4])
        motor_action = response[0]
        client.close()

def TCPIP_Update_Coordinate(current_row, current_col, destination_rack):
    current_row = str(current_row)
    current_col = str(current_col)
    current_coordinate = '('+current_row+','+current_col+','+destination_rack+')'
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_ip = IP_address 
    server_port = 2020  
    client.connect((server_ip, server_port))
    client.send(current_coordinate.encode("utf-8")[:1024])
    client.close()

def set_Forward(speed):
    pi.set_PWM_dutycycle(M1_R_PWM, 0)
    pi.set_PWM_dutycycle(M1_L_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M2_R_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M2_L_PWM, 0)

def set_Reverse(speed):
    pi.set_PWM_dutycycle(M1_R_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M1_L_PWM, 0)
    pi.set_PWM_dutycycle(M2_R_PWM, 0)
    pi.set_PWM_dutycycle(M2_L_PWM, speed * 2.55)


def set_FLeft(speed):
    pi.set_PWM_dutycycle(M1_R_PWM, 0)
    pi.set_PWM_dutycycle(M1_L_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M2_R_PWM, 0)
    pi.set_PWM_dutycycle(M2_L_PWM, speed * 2.55)
    
def set_FRight(speed):
    pi.set_PWM_dutycycle(M1_R_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M1_L_PWM, 0)
    pi.set_PWM_dutycycle(M2_R_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M2_L_PWM, 0)

def set_RRight(speed):
    pi.set_PWM_dutycycle(M1_R_PWM, 0)
    pi.set_PWM_dutycycle(M1_L_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M2_R_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M2_L_PWM, 0)
    
def set_RLeft(speed):
    pi.set_PWM_dutycycle(M1_R_PWM, speed * 2.55)
    pi.set_PWM_dutycycle(M1_L_PWM, 0)
    pi.set_PWM_dutycycle(M2_R_PWM, 0)
    pi.set_PWM_dutycycle(M2_L_PWM, speed * 2.55)
    
def set_Stop():
    pi.set_PWM_dutycycle(M1_R_PWM, 0)
    pi.set_PWM_dutycycle(M1_L_PWM, 0)
    pi.set_PWM_dutycycle(M2_R_PWM, 0)
    pi.set_PWM_dutycycle(M2_L_PWM, 0)

def Line_following_forward(motor_speed, rotate_speed):
    distance= ultrasonic.distance*10
    if distance < 5:
        buzzer.beep(0.1, 0.1, 3)
        set_Stop()
    elif GPIO.input(IRsensor1) == True and GPIO.input(IRsensor2) == True:
        set_Forward(motor_speed)
        print("Forward")
    elif GPIO.input(IRsensor1) == False and GPIO.input(IRsensor2) == True:
        print("Right")
        set_FRight(rotate_speed)
    elif GPIO.input(IRsensor1) == True and GPIO.input(IRsensor2) == False:
        print("Left")
        set_FLeft(rotate_speed)
    else:
        print("Stop")
    
def Rotation_direction(rotate_speed):
    global direction
    if (direction == 'front'):
        set_FLeft(rotate_speed)
    if (direction == 'back'):
        set_FRight(rotate_speed)
        
def Rotation_direction_inverse(rotate_speed):
    global direction
    if (direction == 'back'):
        set_FLeft(rotate_speed)
    if (direction == 'front'):
        set_FRight(rotate_speed)

def Detect_horizontalLine():
    global current_row, destination_row, direction
    step = 1
    while True:
        print(current_row)
        Line_following_forward(rotate_speed,rotate_speed)
        #sleep(0.5)
        if step == 1 and motor_action == '1':
            if GPIO.input(IRsensorMid1) == True or GPIO.input(IRsensorMid2) == True:
                step = 2
        if step == 2 and motor_action == '1':
            if GPIO.input(IRsensorMid1) == False and GPIO.input(IRsensorMid2) == False:
                step = 3
        if step == 3 and motor_action == '1':
            if GPIO.input(IRsensorMid1) == True or GPIO.input(IRsensorMid2) == True:
                step = 4
        if step == 4 and motor_action == '1':
            break

def Rotation180(rotate_speed):
    global current_row, destination_row, direction
    step = 1
    while True:
        print("Rotating")
        if step == 1:
            if GPIO.input(IRsensor1) == True or GPIO.input(IRsensor2) == True:
                Rotation_direction(rotate_speed)
                step = 2
        if step == 2:
            Rotation_direction(rotate_speed)
            if GPIO.input(IRsensor1) == False and GPIO.input(IRsensor2) == False:
                step = 3
        if step == 3:
            if GPIO.input(IRsensor1) == True or GPIO.input(IRsensor2) == True:
                #Line_following_forward(rotate_speed,rotate_speed)
                if (current_row == 1):
                    step = 4
                else:
                    step = 6
        if step == 4:
            Rotation_direction(rotate_speed)
            if GPIO.input(IRsensor1) == False and GPIO.input(IRsensor2) == False:
                step = 5
        if step == 5:
            Rotation_direction(rotate_speed)
            if GPIO.input(IRsensor1) == True or GPIO.input(IRsensor2) == True:
                break
        if step == 6:
            break

def RowNavigation():
    global current_row, destination_row, rotate_speed, direction, buzzer_run
    if (current_row < destination_row):
        buzzer_run = 0
        if (direction == 'back'):
            Rotation180(rotate_speed)
            direction = 'front'
        Detect_horizontalLine()
        current_row = current_row + 1
        TCPIP_Update_Coordinate(current_row, current_col, 'R1')
    elif (current_row > destination_row):
        buzzer_run = 0
        if (direction == 'front'):
            Rotation180(rotate_speed)
            direction = 'back'
        Detect_horizontalLine()
        current_row = current_row - 1
        TCPIP_Update_Coordinate(current_row, current_col, 'R1')
    elif (current_row == destination_row):
        if buzzer_run == 0:
            buzzer.beep(0.5, 0.1, 3)
            buzzer_run = 1
        set_Stop()
    
def cleanup():
    set_Stop()
    pi.stop()
    

# Motor Function End Here
#-----------------------------------------------------------------------
TCPIP_RFID = threading.Thread(target=TCPIP_RFID_EN)
TCPIP_RFID.start()
TCPIP_Coordinate = threading.Thread(target=Item_Coordinate)
TCPIP_Coordinate.start()
#Help = multiprocessing.Process(target=Emergency_button)
#Help.start()

try:
    while True:
        print("Initializing")
        Line_following_forward(motor_speed, rotate_speed)
        if GPIO.input(IRsensorMid1) == True and GPIO.input(IRsensorMid2) == True:
            set_Stop()
            current_row = 1
            current_col = 1
            TCPIP_Update_Coordinate(current_row, current_col, 'R1')
            break
        
    while True:
        print("This is motor action")
        print(motor_action)
        if RFID_EN == '1':
            print("RFID is enabled")
            RFID_Read()
        if motor_action == '1':
            print("This is current row")
            print(current_row)
            print("This  is destination row")
            print(destination_row)
            print("This  is direction")
            print(direction)
            if (current_col != destination_col):
                pass
            elif (current_col == destination_col):
                RowNavigation()
            else:
                set_Stop()
        else:
            set_Stop()
                
except KeyboardInterrupt:
    set_Stop()
    cleanup()
    GPIO.cleanup()
    raise






