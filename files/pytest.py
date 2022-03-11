from __future__ import print_function
import sys
import os
try:
    print("UID: ", os.getuid())
    my_generator = (letter for letter in 'abcdefg')
    next(my_generator)
    my_generator.next()
    print("It Works!")
except:
    print("You Broke It")
    sys.exit(1)
