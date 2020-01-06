class Stack(object):
    def __init__(self,limit=10);
        self.stack = [] #存放元素
        self.limit = limit #栈容量极限

    def push(self,data):
#判断栈是否溢出
    if len(self.stack) >= self.limit:
        raise IndexError("超出栈容量极限")
    self.stack.append(data)

    def pop(sefl):
        if self.stack:
            return self.stack.pop()
        else:
#空栈不能被弹出元素
            raise IndexError('pop from an empty stack')
