import os, random, string

length = int(raw_input("Enter the lenth of characters you want your password to be:  "))
chars = string.ascii_letters + string.digits + '!@#$%^&*()'
random.seed = (os.urandom(1024))

print ''.join(random.choice(chars) for i in range(length))
