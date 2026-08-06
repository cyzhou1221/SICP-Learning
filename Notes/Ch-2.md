# Ch-2

## 2.1 Data Abstraction

### 2.1.2 Abstraction Barriers

An abstraction barrier violation occurs whenever a part of the program that can use a higher level function instead uses a function in a lower level. 

将数据的使用与具体实现相分离

```python
>>> def square_rational(x):
        return mul_rational(x, x)

>>> def square_rational_violating_once(x):
        return rational(numer(x) * numer(x), denom(x) * denom(x))

>>> def square_rational_violating_twice(x):
        return [x[0] * x[0], x[1] * x[1]]
```

解释：只有第一个定义是最稳健的，因为其调用的函数抽象程度更高，对底层数据操作较少. 一旦底层数据架构发生改变，使用第一个定义的话，则无需做大改动.

编程启示：在设计数据结构和方法的时候，进行**层级调用**，尽量避免对原始数据进行直接修改，同时也是控制系统复杂度的好方法.

## 2.3 Sequence

序列：长度有限，通过从 0 开始的下标访问.

### 2.3.1 Lists

不限制元素类型

+ 表示拼接，* 重复

### 2.3.2 Sequence Iteration

for 迭代，相比 while 可以直接省略下标

Ranges. 

```python
>>> list(range(5, 10))
[5, 6, 7, 8, 9]
```

### 2.3.3 Sequence Processing

List Comprehensions.

```python
>>> odds = [1, 3, 5, 7, 9]
>>> [x+1 for x in odds]
[2, 4, 6, 8, 10]
>>> [x for x in odds if 25 % x == 0]
[1, 5]
```

general form

```python
[<map expression> for <name> in <sequence expression> if <filter expression>]
```

### 2.3.4 **Sequence Abstraction**

1. Membership: `in` and `not in`
2. Slicing: 切片，指的是子序列

```python
>>> digits
[1, 8, 2, 8]
>>> digits[0:2]
[1, 8]
>>> digits[1:]
[8, 2, 8]
```

### 2.3.5 Strings

Also sequence

Membership: is different，是判断子字符串是否包含于当前字符串中

构造函数 `str()` 可放入任何对象来新建一个字符串

## 2.4 Multiple Representations for Abstract Data

### 2.4.2 Tagged data

[ Type,  Data ]

在运算之前，读取 Data 类型，然后查表进行运算

根据此思路，可以从底层构建起整个算数系统，包含（加减乘除），覆盖：有理数、复数、多项式等多种数据类型

复杂之处在于不同类型的数据如何进行运算？—> 类型转换

缺陷：如果想增添一种通用运算，比如判断是否相等，需要对整个系统进行修改，工作量巨大