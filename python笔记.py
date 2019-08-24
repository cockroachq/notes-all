python笔记(I:\BaiduNetdiskDownload\python基础篇)

列表推导式
[expr for iter_var in iterable]
说明：首先迭代iterable里的所有内容，每迭代一次，都把iterable里相应内容放到iter_var中，
再在表达式中应用该iter_var的内容，最后用表达式的计算值生成一个列表。

[expr for iter_var in iteralbe if cond_expr]
说明：加入判断语句，只有满足条件内容才把iterable里相应内容放到int_var中，再在表达式中
应用该iter_var的内容，最后表达式的计算值生成一个列表。

------------------------------
del 
a = [1,2,3]
b = a

del a
b里的内容还是 [1,2,3]
del a 删除列表对象的引用

del a[:]
b现在为空列表
del a[:] 清空列表对应的元素

-------------------

字典
keys():返回的是列表，里面包含了字典的所有键
values():返回的是列表，里面包含了字典的所有值
items()：生成一个字典的容器

--------------

--15
列表排序
lt=[(1,2,3),(3,2,8),(5,9,3)]
根据列表内元组的第二位倒序排序：
lt.sort(key=lambda x:x[1],reverse=True)

根据列表内元组的前两位倒序排序：
import operator
lt.sort(key=operator.itemgetter(0,1))


空集合创建方式：set(),不能使用圆括号创建


进阶篇--01
小工具：virtualenv
书籍：程序员的数学
      大话数据结构
      python标准库
      python基础教程
      docs.python.org
      啄木鸟社区的邮件列表

02--函数
2.1 函数的参数
  可选参数，有默认值
  必选参数，没有默认值
