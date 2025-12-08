import threading
import time

def run_with_interval(func1, func2, interval=1.0):
    stop_flag = False

    def runner():
        while not stop_flag:
            time.sleep(interval)   
            func2()

    t = threading.Thread(target=runner)
    t.start()

    try:
        return func1()         # блокирующее выполнение
    finally:
        stop_flag = True
        t.join()

def run_with_delay(func1, func2, delay=1.0):

    def runner():
        time.sleep(delay)   
        func2()


    t = threading.Thread(target=runner)
    t.start()

    try:
        return func1()         # блокирующее выполнение
    finally:
        t.join()