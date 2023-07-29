# Модуль лексического разбора кода
import ply.lex as lex


class CustomLexer(object):
    # Токены лексем
    tokens = ('TYPE', 'VAR', 'RECORD', 'TERM', 'COLON', 'SEMICOLON', 'COMMA', 'SCALAR', 'TIPE', 'SIGN', 'END')

    # Добавление символов игнорирования
    t_ignore = ' \r\t\f'

    # Добавление регулярных выражений для поиска лексем
    t_TYPE = r'((?:type)\w*)'
    t_VAR = r'((?:var)\w*)'
    t_END = r'((?:end)\w*)'
    t_SCALAR = r'((?:byte|real)\w*)'
    t_RECORD= r'((?:record)\w*)'
    t_TERM = r'[a-zA-Z]\w*'
    t_COMMA = r','
    t_COLON = r':'
    t_SEMICOLON = r';'
    t_SIGN = r'='
    t_TIPE = r'((?!byte|real))(((?<=[:])([a-zA-Z]\w*)(?=[;]))|([a-zA-Z]\w*)(?=[=]))'

    # Функция игнорирования комментария
    def t_comment(self, t):
        r'[#].*\n'
        t.lexer.skip(1)

    # Функция вывода лексемы в новой строке
    def t_newline(self, t):
        r'\n+'
        t.lexer.lineno += len(t.value)

    # Функция выведения ошибки лексического анализа
    def t_error(self, t):
        print("Illegal character '%s'" % t.value[0])
        t.lexer.skip(1)

    # Build the lexer
    def build(self, **kwargs):
        self.lexer = lex.lex(module=self, **kwargs)

    # Test it output
    def test(self, data):
        self.lexer.input(data)
        while True:
            tok = self.lexer.token()
            if not tok:
                break
            print(tok)


if __name__ == "__main__":
    data = '''
    type
        Temperature=real;
        Address=byte;
        Sensor=record SensType:byte;Sens:Address;Current:Temperature; end;
    var
        Last, First: real;
        TMP:Sensor;
        Needed:Temperature;
    '''

    lexer = CustomLexer()
    lexer.build()
    lexer.test(data)
