#!/usr/bin/env python3

# 42 outside

def foo():
    return '#!/usr/bin/env python3\n\n# 42 outside\n\ndef foo():\n    return %r\n\ndef main():\n    # 42 inside\n\n    a = foo()\n    print(a%%a)\n\nmain()'

def main():
    # 42 inside

    a = foo()
    print(a%a)

main()
