#!/usr/bin/env python3

file = open("Grace_kid.py", "w")
code = '#!/usr/bin/env python3\n\nfile = open("Grace_kid.py", "w")\ncode = %r\nft = lambda x: file.write(x%%x) and file.close()\n\n# 42\n\nft(code)\n'
ft = lambda x: file.write(x%x) and file.close()

# 42

ft(code)
