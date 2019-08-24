1.1 变量命名惯例：
    以单一下划线开头变量名(_var)不会被from module import * 语句导入
    前后有两个下划线变量名(__var__)是系统定义的变量名，对python解释器有特殊意义
    以两个下划线开头但结尾没有下划线的变量名(__var)是类的本地变量
    交互式模式下，变量名"_"用于保存最后表达式的结果
  注：变量名没有类型，对象才有

1.2 逻辑运算
    身份操作符：is
    比较操作符：< ,>,<=,>=,!=,==
    成员操作符：in,not in
    逻辑运算符：and,or,not

1.3 模块内建变量：__name__
    __name__="__main__"，模块被直接直接时
    __name__="模块名称"，被其他模块导入时
    
1.4 对象的三部分：身份、类型、值
    两个对象比较：
    值比较：对象中的数据是否相同，a==b
    身份比较：两个变量名引用的是否为同一对象，a is b
    类型比较：两个变量的类型是否相同，type(a) is type(b)
    
1.5 核心数据类型
    数字：int,float,complex
    字符:str,unicode
    列表:list
    字典:dict
    元组:tuple
    文件:file
    其他类型:集合(set),forzenset,类类型.None,bool
    
1.6 类型转换
    强制转换
        str(),repr()或format()：将非字符型数据转换为字符
        int()
        float()
        list()
        dict()
        tuple()
        
        set()
        forzenset()
        chr()：将整数转换为字符
        ord()：将字符转换为整数值
        
1.7 callable()
    查看对象是否可调用
 
1.8 点号运算符
    属性：数据
        返回一个数据，显示则要使用print语句
    方法：操作()
        调用：执行一段代码
        
1.9 真、假
    非零数字为真，否则为假
    非空对象为空，否则为假
    None始终为假
    
2.1 while 循环
    语法格式：
        while boolean_expression:
            while...suite
        else:
            else...suite
    else分支为可选部分
    boolean_expression的结果为False时终止循环，此时如果有else分支，则会执行
    如果循环终止是由break跳出导致的，则else不会执行。
    
2.2 迭代
    迭代：重复做一件事
    iterable(可迭代)对象
        支持每次返回自己所包含的一个成员的对象
        对象实现了 __iter__ 方法
        举例：
            序列类型：list、str、tuple
            非序列类型：dict、file
            用户自定义的一些包含了 __iter__() 或 __getitem__() 方法的类
    使用 iter() 可从任何序列对象中得到迭代器
    
2.3 生成器表达式
    生成器表达式并不真正创建数字列表，而是返回一个生成器对象，此对象在
  每次计算出一个条目后，把这个条目"产生"(yield)出来
    生成器表达式使用了"惰性计算"或"延迟求值"的机制
    语法：
        (expr for iter_var in iterable)
        (expr for iter_var in iterable if cond_expr)
        
    enumerate：返回一个生成器对象
        j=enumerate(S)
        每次调用j.next()会返回一个元组(S的索引和值)
        
2.4 文件操作
    var_name=open(file_name[mode[bufsize]])
        mode:
            r
            w
            a
            r+
            w+
            a+
            rb
            wb
            ab
            rb+
            wb+
            ab+
        缓冲：
            0：禁用
            负数：使用系统默认缓冲
            1：使用缓冲，只缓冲一行数据
            2+：指定缓冲大小
    var_name.seek(offset[whence])
        whence：
            0：从文件头开始偏移(默认值)
            1：从当前位置开始偏移
            2：从文件尾部开始偏移
        offset：偏移量    
    
练习：判断文件是否存在，存在则打开
让用户通过键盘反复输入多行数据
追加保存至此文件中
###########    
#!/bin/env python3

import os
import os.path

filename = '/home/shu/test.txt'

if os.path.isfile(filename):
    f1 = open(filename,'a+')
    
while True:
    line = raw_input('Enter something>')
    if line == 'q' or line == 'quit'
        break
    
    f1.write(line+'\n')

f1.close()
########

    对象持久存储：
        pickle
        marshal
        
        DBM接口
        
        shelve模块
    
3.1 函数
    python中可以创建4中函数
        全局函数：定义在模块中
        局部函数：嵌套于其他函数中
        lambda函数：表达式
        方法：与特定数据类型关联的函数，并且只能与数据类型关联使用
    
    def 是一个可执行语句
    def 创建了一个对象并将其赋值给一个变量名(即函数名)
    return 用于返回结果对象，其为可选：无return语句的函数自动返回 None 对象
    
3.2 变量及作用域
    函数定义了本地作用域，而模块定义了全局作用域
        每个模块都是一个全局作用域，因此，全局作用域的范围仅限于单个程序文件
        每次对函数的调用都会创建一个新的本地作用域，函数内赋值的变量除非声明为全局变量，否则均为本地变量
        所有的变量名都可以归纳为本地、全局或内置的(由 __builtin__ 模块提供)
        
3.2 闭包
    定义2个函数f1,f2，且f2嵌套于f1，f2引用了f1中的变量。在f1的最后 return f2。
    以上情况下调用f1后，f1中被f2引用的变量不会消失，会被f2记住。
    
3.3 函数参数
    定义函数时
        *args
        **args
    给函数传递参数时
        *var
        **var
      
3.4 函数式编程
    也称作泛函编程，是一种编程范式
    
    过滤器：
        filter()为已知的序列的每个元素调用给定的布尔函数
        调用中，返回值为非零的元素将被添加至一个列表中
        
    
    