# Модуль синтаксического разбора кода
# Добавлен метод получения дерева синтаксического вывода
from lab89 import CustomLexer
import ply.yacc as yacc

# Список лексем
tokens = CustomLexer.tokens


# По функциям раскиданы правила грамматики
# S -> TYPE L VAR R;
# L -> T SEMICOLON | T SEMICOLON L
# T -> TIPE SIGN SCALAR | TIPE SIGN D
# R -> V SEMICOLON | V SEMICOLON R
# V -> K COLON TIPE | K COLON SCALAR | K COLON D
# K -> TERM | K COMMA TERM
# D -> RECORD F END
# F -> E | F SEMICOLON E
# E -> K COLON SCALAR | K COLON TIPE


def p_Sstr(p):
    '''Sstr : TYPE Lstr VAR Rstr'''

    p[0] = [p[1]]

    type = {}
    var = {}

    for i in range(0, len(p[2]) - 1, 3):
        type[p[2][i]] = p[2][i + 1]

    p[0] += [type, p[3]]

    i = 0

    while i < (len(p[4]) - 1):
        key = p[4][i + 2]
        str = key[0]
        if str != 'record':
            var[key] = p[4][i]
            i += 4
        else:
            strok = ''
            for kol in p[4][i]:
                strok = strok + '' + kol + ''
            record_var = '(record) ' + strok
            var[record_var] = key[1]
            i += 5

    p[0] += [var]



def p_Lstr(p):
    '''Lstr :  Tstr SEMICOLON
            |  Tstr SEMICOLON Lstr'''
    if len(p) == 3:
        p[0] = p[1]
    else:
        p[0] = [p[1][0], p[1][1], p[2]] + p[3]



def p_Tstr(p):
    '''Tstr : TIPE SIGN SCALAR
            | TIPE SIGN Dstr'''
    p[0] = [p[1], p[3]]



def p_Rstr(p):
    '''Rstr : Vstr SEMICOLON
            | Vstr SEMICOLON Rstr'''
    if len(p) == 3:
        p[0] = p[1] + [p[2]]
    else:
        p[0] = p[1] + [p[2]] + p[3]



def p_Vstr(p):
    '''Vstr   : Kstr COLON TIPE
              | Kstr COLON SCALAR
              | Kstr COLON Dstr'''
    if p[3][0] != 'record':
        p[0] = [p[1], p[2]] + [p[3]]
    else:
        p[0] = [p[1]] + [p[2]] + [p[3]]



def p_Kstr(p):
    '''Kstr  : TERM
             | Kstr COMMA TERM'''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1] + [p[3]]



def p_Dstr(p):
    '''Dstr  : RECORD Fstr END'''
    p[0] = [p[1]]
    var = {}

    for i in range(0, len(p[2]) - 1, 2):
        var[p[2][i + 1]] = p[2][i]

    p[0] += [var]


def p_Fstr(p):
    '''Fstr  : Estr SEMICOLON
             | Fstr Estr SEMICOLON'''
    if len(p) == 3:
        p[0] = p[1]
    else:
        p[0] = p[1] + p[2]



def p_Estr(p):
    '''Estr  : Kstr COLON SCALAR
             | Kstr COLON TIPE'''
    p[0] = [p[1]] + [p[3]]


# Функция вывода ошибок
def p_error(p):
    print('Unexpected token:', p)


# Запуск синтаксического анализа и формирования файлов с правилами
parser = yacc.yacc()

# Запуск тестирования модуля
if __name__ == "__main__":
    data_var = '''
    type
        Temperature=real;
        Address=byte;
        Sensor=record SensType:byte;Sens:Address;Current:Temperature; end;
    var
        Last, First: real;
        TMP:Sensor;
        Needed:Temperature;
    '''

    new_lexer = CustomLexer()
    new_lexer.build()

    tree_list = parser.parse(data_var)
    print(tree_list)
