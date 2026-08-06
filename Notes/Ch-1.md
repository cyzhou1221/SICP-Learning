# Ch-1

控制系统复杂度的方法：

1. 黑箱抽象：Black Box Abstraction
2. 约定接口：Conventional Interfaces
3. 元语言抽象：Metalinguistic Abstraction，例如创建一门新的语言

A language

- Primitive Elements
- Means of Combination
- Means of Abstraction

Lisp

`(+ 3 5 (* 5 6) 17.4)`  treat this as a tree

`-5 // 4`  结果为 -2，`//` 对结果向下取整

`“””` 多行注释，`#` 单行注释

## 1.3 Defining New Functions

函数：强有力的抽象技巧

带有函数的程序的执行：层层嵌套，局部变量相互独立

函数和变量命名：

1. 变量、函数名小写，下划线分割

## 1.4 Designing Functions

1. 每个函数只做一件事
2. 利用函数来减少代码复用
3. 函数要具有通用性

写函数记得写文档

```python
>>> def pressure(v, t, n=6.022e23):
        """Compute the pressure in pascals of an ideal gas.

        v -- volume of gas, in cubic meters
        t -- absolute temperature in degrees kelvin
        n -- particles of gas (default: one mole)
        """
        k = 1.38e-23  # Boltzmann's constant
        return n * k * t / v
```

参数定义里的 `=` 表示默认参数

## 1.5 Control

Rather than being evaluated, statements are *executed*. Each statement describes some change to the interpreter state, and executing a statement applies that change.

**Conditional statements**

```python
if <expression>:
    <suite>
elif <expression>:
    <suite>
else:
    <suite>
```

**Iteration**

```python
while <expression>:
    <suite>
```

`and or not`

## **1.6   Higher-Order Functions**

定义：将函数作为参数和返回值的函数

1. 函数作为参数
2. 设置模板，例如迭代法里的更新步骤和终止条件嵌套步骤
3. 函数嵌套定义
4. 函数作为返回值

Lambda Expressions

```python
     lambda            x            :          f(g(x))
"A function that    takes x    and returns     f(g(x))"
```

```python
>>>s = lambda x: x * x
>>>s
<function <lambda> at 0xf3f490>
>>>s(12)
144
```