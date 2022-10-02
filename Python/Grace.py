#!/usr/bin/env python3

file = open("Grace_kid.py", "w")
code = '#!/usr/bin/env python3\n\nfile = open("Grace_kid.py", "w")\ncode = %r\nfile.write(code%%code)\nfile.close()'
ft = lambda x: file.write(x%x); file.close()

# 42

ft(code)
