from lab89 import CustomLexer
from tree import parser

class MemoryCalculate:
    def __init__(self, type_dict, var_dict):
        self.type_dict = type_dict
        self.var_dict = var_dict

        self.c_types = ['byte', 'real']
        self.t_types = []

        self.status_of_type_section = None
        self.status_of_var_section = None

        self.usage_memory = [0, 0]

    def calculation(self):
        self.status_of_type_section = self.__type_check()
        self.status_of_var_section = self.__var_check()

        if self.status_of_type_section[0] == 'Error':
            print(self.status_of_type_section)
        elif self.status_of_var_section[0] == 'Error':
            print(self.status_of_var_section)
        else:
            print(self.status_of_type_section[0])
            print(self.status_of_var_section[0], '\n')

            self.__memory_count()

            print('..............................................')
            print('Usage memory with multiplicity', self.usage_memory[0])
            print('Usage memory without multiplicity', self.usage_memory[1])
            print()

    def __memory_count(self):
        print('Calculation...')
        print()

        sample = [0, 0]

        for var in self.var_dict.keys():
            if var in self.c_types:
                sample = self.__memory_for_scalar(var, self.var_dict[var])
            elif var in self.t_types:
                if self.type_dict[var][0] != 'record':
                    sample = self.__memory_for_scalar(self.type_dict[var], self.var_dict[var])
                else:
                    sample = self.__record_count(self.var_dict[var], self.type_dict[var][1])
            elif 'record' in var:
                sample = self.__record_count(var, self.var_dict[var])

            self.usage_memory[0] += sample[0]
            self.usage_memory[1] += sample[1]

    def __memory_for_scalar(self, scalar, lst):
        if scalar == 'byte':
            return self.__str_memory(lst, 1)

        elif scalar == 'real':
            return self.__str_memory(lst, 6)

    @staticmethod
    def __str_memory(lst, size):
        scalar_with_multiply, scalar_without_multiply = len(lst) * size * 4, len(lst) * size

        print(f"{lst} {size} byte per element")
        print(' - with multiplicity: ', f"{scalar_with_multiply} byte")
        print(' - without multiplicity: ', f"{scalar_without_multiply} byte")
        print()

        return [scalar_with_multiply, scalar_without_multiply]

    def __record_count(self, name, record_dict):
        max_counters = [0, 0]

        print('.............................................')

        for elem in record_dict.keys():
            if elem in self.c_types:
                sample = self.__memory_for_scalar(elem, record_dict[elem])
            elif elem in self.t_types:
                sample = self.__memory_for_scalar(self.type_dict[elem], record_dict[elem])
            else:
                sample = [0, 0]

            if sample[0] > max_counters[0]:
                max_counters[0] = sample[0]
                max_counters[1] = sample[1]

        print('.............................................')
        print(f"{name} n byte")
        print(' - with multiplicity: ', f"{max_counters[0]} byte")
        print(' - without multiplicity: ', f"{max_counters[1]} byte")
        print()

        return max_counters

    def __type_check(self):
        for key in self.type_dict.keys():
            if self.type_dict[key] in self.c_types:
                self.t_types += [key]

            elif type_dict[key][0] == 'record':
                record_dict = type_dict[key][1]
                for jey in record_dict.keys():
                    if jey in self.c_types or jey in self.t_types:
                        continue
                    else:
                        return ['Error', 'type', self.type_dict[key][0]]
                self.t_types += [key]

            else:
                return ['Error', 'type', key]

        return ['All types in section are correct']

    def __var_check(self):
        for var in self.var_dict.keys():
            if var in self.c_types or var in self.t_types:
                continue
            elif 'record' in var:
                for var_record in self.var_dict[var]:
                    if var_record in self.c_types or var_record in self.t_types:
                        continue
                    else:
                        return ['Error', 'var', var_record]
            else:
                return ['Error', 'var', var]

        return ['All vars in section are correct']


if __name__ == '__main__':
    # Открытие и чтение примера из файла
    input_file_path = 'Input.txt'
    file = open(input_file_path, 'r')
    example = file.read()
    file.close()

    # Синтаксический анализ примера и вывод двух словарей: var и type
    new_lexer = CustomLexer()
    new_lexer.build()
    program_list = parser.parse(example)

    # Определение словарей из дерева вывода
    type_dict = program_list[1]
    var_dict = program_list[3]

    # Вычисление занятой памяти
    calculator = MemoryCalculate(type_dict=type_dict, var_dict=var_dict)
    calculator.calculation()
