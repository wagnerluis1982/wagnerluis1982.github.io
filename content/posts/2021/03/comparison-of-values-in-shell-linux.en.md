---
title: 'Comparison of values in Shell Linux'
date: 2021-03-19T14:40:47+01:00
draft: false
tags : [linux, bash, shell]
summary: |
  Back in time when I was trying to learn shell, I got confused with the many forms to perform comparison of values.
  Three main comparison methods is shown here, each with advantages and disadvantages.
translationKey: 'comparison-of-values-in-shell-linux'

ShowToc: true
TocOpen: true
---

In this first post, I am revisiting an old post I wrote in Portuguese. I am trying to go back in time, years ago, when I was trying to learn how to program in shell, I got confused with the many offered forms to perform comparison of values, most of that by using external commands such as `grep`, `awk` and `sed`, among others.

Here I am going to concentrate in the embedded comparison methods, which in general, are more used for variables comparison. I am not going to talk about conditionals or loops, so I expect the reader has previous understanding about the subject (at least to know how the `if` behaves). To be clear, the shell where the commands were tested is **bash**, the default in Linux systems.

It's perfectly possible to create scripts without a single comparison, several times is not really required. However, through this resource, we can make our script make decisions, be based em something provided by the user or information coming from the computer, as well as to protect the script against possible failures, by returning the best result for our users (which often are ourselves).

The command test
----------------

The command `test` is a swiss army knife for verification tasks, it can be used to compare values or, even, check files. Most of the scripts are written using this command. The reason behind this is because `test` is present in the Unix specification, so, by using it, you will ensure your script is more portable, i.e. will work on both Linux, BSD, Solaris, AIX and so many other Unix-based systems. In order to focus, I will present only the comparison functions.

There are two syntaxes for the command, one using the command name as is, `test`, and other surrounded by square brackets, which makes easier to read and write scripts, as you can see in the examples below. The last syntax is the one I commonly use.

```bash
# using command test
test CONDITION

# using brackets notation
[ CONDITION ]
```

To compare strings, we use the operators `=` to express equality, and `!=` to check for inequality.

```bash
# equality of strings
[ "$var" = "activate" ]

# inequality of strings
[ "$var" != "" ]
```

In addition to these two basics, there are the parameters `-n` and `-z`, for testing, respectively, if the given string is not empty and if the given string is empty. In the examples below, we see the usage for these parameters. You can see on comments the equivalent test using the equality operators presented above.

```bash
# not zero [ "$var" != "" ]
[ -n "$var" ]

# zero [ "$var" = "" ]
[ -z "$var" ]

# verifying if the argument $1 has a value
if [ -n "$1" ]; then
  ...
fi
```

It is very important to know that when comparing string variables, we should always enclose them in double quotes, because if there are spaces in the string stored there, the shell will try to interpret the individual elements of the string after each space as commands or arguments, resulting in errors or unexpected behavior of the script. However, single quotes should not be used, as the variable will not be interpreted, so it `'$var'` will be read exactly as “$var”, regardless of the value of that variable.

The command `test` also has simple mathematical comparisons (only for integers). It uses the following arguments:

- `-eq` (equals)
- `-ne` (not equals)
- `-gt` (greater than)
- `-ge` (greater than or equals)
- `-lt` (less than)
- `-le` (less than or equals)

Examples:

```bash
var=5

# In the shell  # In maths
[ $var -eq 5 ]  # 5 == 5
[ $var -ne 5 ]  # 5 != 5
[ $var -gt 3 ]  # 5 > 3
[ $var -ge 4 ]  # 5 >= 4
[ $var -lt 4 ]  # 5 < 4
[ $var -le 5 ]  # 5 <= 5
```

In addition, the `test` command allows to express logical expressions (conjunction, disjunction and negation) with the parameters `-a` (AND), `-o` (OR) and the operator `!`. Thus, it is possible to have more complex expressions, according to the following.

```bash
if [ -n "$name" -a $value -gt 1000 -o $value -lt 500 ]; then
  ...
elif [ ! $value -eq 10 ]; then
  ...
fi
```

> Ugh!!! These `-a` and `-o` hurt my eyes 🙈
>
> You will get better results by using the shell constructions `&&` and `||`. Rewriting, we got:
>
> ```bash
> [ -n "$name" ] && [ $value -gt 1000 ] || [ $value -lt 500 ]
> ```
>
> This notation comes with a bonus: you can specify precedence (not possible with `-a` and `-o`).
>
>
> ```bash
> # note the last two expressions are composed
> [ -n "$name" ] && ( [ $value -gt 1000 ] || [ $value -lt 500 ] )
> ```

At this point, almost half of the command `test` was covered. In a future text I intend to talk more about the command, with more details, more examples and with the the parameters to check file information.

Arithmetical comparison
-----------------------

The shell has another great feature, specific for checking arithmetic values, where the most known comparison operators, such as `>` instead of `-gt`, is used, exactly like you can see in languages ​​C, C ++, Java, among others. It can be used by surrounding the expressions between `((` and `))`.

Using the arithmetic evaluator, you do not type `$` at the beginning of the variable names, and you also can perform small computations. A few examples:

```bash
var=5

(( var == 5 ))
(( var + 1 != 5 ))
(( var - 1 > 3 ))
(( var * 2 >= 10 ))
(( var / 3 < 4 ))

if (( var % 2 == 0 )); then
  ...
fi
```

You can also increment and decrement in the same fashion of C language, including with pre-increment and pre-decrement. In addition, special operators such as bit shift operators (also known as _bitwise_ operators) are also present, among many others. In another text, I am going to write a little more about this feature.

Comparing strings
-----------------

This section may seem odd, since the command `test` already does the job of comparing strings. However, bash (among other shells such as zsh) provides another command specially useful for strings. With this command, the expression must be between `[[` and `]]` (surrounded by square brackets). It allows, in addition to the simple equality of strings (`==` and `!=`), to check the lexicographic order of the strings, with the operators `>` and `<`, as you can see in action in the following.

```bash
animal1='horse'
animal2='giraffe'

# will print: horse comes before giraffe
if [[ $animal1 < $animal2 ]]; then
  echo "$animal1 comes before $animal2"
else
  echo "$animal1 comes after $animal2"
fi
```

> This functionality comes with an extra 
>
> You are not required to enclose the string between quotes 😀

I believe the definitive feature of this command is to enable you to compare strings by using a regular expression. For that, you must use the `=~` operator. In the left side of the expression, you write the string to be tested, to the right you place the regular expression, as shown in the example below.

```bash
text='Around the rugged rocks the ragged rascal ran'

# following expression evaluates to true, because it is looking for
# the word "rocks" in the middle of the $text and "ran" at the end
if [[ $text =~ ^.*rocks.*ran$ ]]; then
  ...
fi
```

Wrapping up
-----------

Three main forms of comparison were shown, each with advantages and disadvantages. Which to use is up to you need and what you need in your scripts. However, it is always important to note that this text is, in no way, exhaustive regarding to all the options and possibilities the shell offers. Indeed, that was not the purpose, but to present a general overview of each one in order to be able to serve as a learning experience for those who are starting in the shell. Also, it serves as a reference to myself 😎

I hope you have liked it, leave comments, may be doubts, compliments or criticisms.

Take care, I hope to see you soon!
