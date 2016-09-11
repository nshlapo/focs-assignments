def calc_as_you_go(in_list):
    mem = 0
    op = '+'
    for ele in in_list:
        if type(ele) is int or type(ele) is float:
            ele = float(ele)
            if op == '+':
                mem += ele
            elif op == '-':
                mem -= ele
            elif op == '*':
                mem *= ele
            elif op == '/':
                mem /= ele

        if type(ele) is str:
            op = ele

    return mem

list1 = [1, '+', 2]
list2 = [1, '+', 2, '+', 3]
list3 = [3, '-', 1]
list4 = [2, '*', 3, '+', 4]
list5 = [4, '+', 2, '*', 3]

# print calc_as_you_go(list1)
# print calc_as_you_go(list2)
# print calc_as_you_go(list3)
# print calc_as_you_go(list4)
# print calc_as_you_go(list5)

l1 = [2, 3, 4, '+','*']

def calc_rpn(in_list):
    stack = []
    op_dict = {'+': lambda x, y: x + y,
               '-': lambda x, y: x - y,
               '*': lambda x, y: x * y,
               '/': lambda x, y: x / y}

    for ele in in_list:
        if type(ele) is int:
            stack.append(ele)

        if type(ele) is str:
            val = op_dict[ele](stack.pop(), stack.pop())
            stack.append(val)

    return stack.pop()

print calc_rpn(l1)