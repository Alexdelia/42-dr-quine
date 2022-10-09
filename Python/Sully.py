#!/usr/bin/env python3

from os import F_OK, access
from subprocess import call

i = 5
if i == 0:
    exit()

file = open("Sully_%d.py" % i, "w+")
code = '#!/usr/bin/env python3\n\nfrom os import F_OK, access\nfrom subprocess import call\n\ni = %d\nif i == 0:\n    exit()\n\nfile = open("Sully_%%d.py" %% i, "w+")\ncode = %r\n\nif access("Sully_5.py", F_OK):\n    i -= 1\n\nfile.write(code %% (i, code))\nfile.close()\n\ncall(["python3", "Sully_%%d.py" %% (i + 1)])\n'

if access("Sully_5.py", F_OK):
    i -= 1

file.write(code % (i, code))
file.close()

call(["python3", "Sully_%d.py" % (i + 1)])
