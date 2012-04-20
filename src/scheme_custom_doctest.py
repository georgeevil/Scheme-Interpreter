'''
Created on Apr 19, 2012

@author: georgeevil
'''
from scheme import *
from scheme_primitives import *

@main
def main():
    
    check_formal_test()
    
    return

def check_new_environment():
    
    pass

def check_formal_test():
    p1 = Pair(Symbol('a'), Number(1))
    p2 = Pair(Symbol('a'), Symbol('b'))
    p3 = Pair(Symbol('a'), Pair(Symbol('a'), NULL))
    p3 = Pair(Symbol('a'), Pair(Symbol('a'), Number(2)))
    p3 = Pair(Symbol('a'), Pair(Symbol('a'), Symbol('b')))
    p3 = Pair(Symbol('a'), Pair(Symbol('a'), Number(2)))
    p4 = Pair(Symbol('a'), Pair(Symbol('a'), Symbol('b')))
    p5 = Pair(NULL, NULL)
    p6 = Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), NULL))))))))))
    p7 = Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Number(9)))))))))))
    p8 = Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), Pair(Symbol('a'), NULL))))))))))

    try:
        Evaluation.check_formals(p1)
    except SchemeError as exc:
        print("Error: {0}".format(exc.args[0]), file=sys.stderr)
    try:
        Evaluation.check_formals(p2)
    except SchemeError as exc:
        print("Error: {0}".format(exc.args[0]), file=sys.stderr)
    try:
        Evaluation.check_formals(p3)
    except SchemeError as exc:
        print("Error: {0}".format(exc.args[0]), file=sys.stderr)
    try:
        Evaluation.check_formals(p4)
    except SchemeError as exc:
        print("Error: {0}".format(exc.args[0]), file=sys.stderr)
    try:
        Evaluation.check_formals(p5)
    except SchemeError as exc:
        print("Error: {0}".format(exc.args[0]), file=sys.stderr)
    try:
        Evaluation.check_formals(p6)
    except SchemeError as exc:
        print("Error: {0}".format(exc.args[0]), file=sys.stderr)
    try:
        Evaluation.check_formals(p7)
        Evaluation.check_formals(p8)

    except SchemeError as exc:
        print("Error: {0}".format(exc.args[0]), file=sys.stderr)
    
        
    str(p6)
    '(a a a a a a a a a a)'
    str(p7)
    '(a a a a a a a a a a . 9)'
    repr(p6)
    "cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), cons(Symbol('a'), <scheme_primitives.Null object at 0x1014b1f90>))))))))))"
    Evaluation.check_formals(p8)

    return

if __name__ == '__main__':
    main()
    pass


