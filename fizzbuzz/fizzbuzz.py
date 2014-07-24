def fizzbuzz(range):
    for x in range:
        if x % 15 == 0:
            print("FIZZBUZZ")
        elif x % 3 == 0:
            print ("FIZZ")
        elif x % 5 == 0:
            print("BUZZ")
        else:
            print x

fizzbuzz(range(100))
