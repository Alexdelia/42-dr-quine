#!/usr/bin/env python3

from os import access

i = 5
if i == 0:
    exit()

file = open("Sully_%d.py" % i, "w")
code = '#!/usr/bin/env python3\n\ni = %d\n\nif i == 0:\n    exit()\n\nfile = open("Sully_%%d.py" %% i, "w")\ncode = %r\n\n

if access(f"Sully_{i}.py", True):
    i -= 1
file.write(code%(i, code))
file.close()
