---
title: 'Comparação de valores no Shell Linux'
date: 2012-09-22T19:29:00.000-03:00
draft: false
aliases: [ "/2012/09/comparacao-de-valores-no-shell-linux.html" ]
tags : [linux, bash, shell]
---

Nesse meu primeiro texto, além do post inicial falando sobre mim, eu estou tentando voltar no tempo, alguns anos atrás, quando eu tentava aprender a programar em shell e me confundia com as tantas formas de realizar comparações no shell, a maioria utilizando comandos externos como grep, awk e sed, entre outros. Aqui eu só vou abordar as formas embutidas, que em geral tem maior desempenho, para comparações de variáveis. Nesse eu não vou abordar estruturas condicionais ou loops, assim espera-se que o leitor já tenha um entendimento sobre (pelo menos saiba o que é um `if`). E ainda, para ficar mais claro, o shell aqui usado é o bash, o padrão dos sistemas Linux.

É possível criar scripts sem precisar fazer nenhuma comparação, muitas vezes nem é necessário. Porém através deste recurso, podemos fazer nosso script tomar decisões, sejam elas baseadas em algo informado pelo usuário ou provenientes de informações obtidas do computador, bem como proteger o script contra possíveis falhas, retornando melhor informação para seus usuários (que muitas vezes somos nós mesmos).

O comando test
--------------

O comando `test` é um canivete suíço para as tarefas de verificações, servindo para checar arquivos ou comparar valores. A maior parte dos scripts são escritos utilizando esse comando. O motivo disso é porque o `test` está presente na especificação dos sistemas Unix, assim, ao usá-lo, será mais garantido que o seu script seja portável, ou seja, que funcione tanto no Linux, BSD, Solaris, AIX e tantos outros sistemas que seguem o padrão Unix. De modo a garantir o foco, só vou apresentar as funções de comparação.

Existem duas sintaxes para esse comando, uma usando o próprio comando `test` e outra entre colchetes, o que facilita a leitura e escrita dos scripts, conforme os exemplos abaixo. Essa última sintaxe é a que eu comumente uso.

```bash
# usando o comando test
test CONDICAO

# usando a notação entre colchetes
[ CONDICAO ]
```

Para comparar strings, usamos os operadores `=`, para igualdade, e `!=`, para desigualdade.

```bash
# igualdade de strings
[ "$var" = "ativar" ]

# desigualdade de strings
[ "$var" != "" ]
```

Além desses dois básico, existem os parâmetros `-n` e `-z`, para testarem, respectivamente, se o tamanho da string não é zero e se o tamanho da string é zero. Nos exemplos abaixo, vemos o uso desses parâmetros e nos comentários estão escritos, para maior clareza, um teste que faz o mesmo efeito, mas da forma anterior.

```bash
# não zero [ "$var" != "" ]
[ -n "$var" ]

# zero [ "$var" = "" ]
[ -z "$var" ]

# verificando se o argumento $1 tem valor
if [ -n "$1" ]; then
  ...
fi
```

É muito importante saber que, ao comparar strings, devemos sempre colocá-las entre aspas duplos, pois se houver espaços na string guardada lá, o shell tentará interpretar os elementos da string após o espaço como comandos ou argumentos, resultando em erros ou comportamento inesperado do script. No entanto não deve-se usar aspas simples, pois assim a variável não será interpretada, assim `'$var'` será lida como "$var", independente do valor dessa variável.

O comando `test` também faz comparações matemáticas simples (apenas inteiros). Usando os seguintes argumentos:

- `-eq` (equal), para igualdade
- `-ne` (not equal), para desigualdade
- `-gt` (greater than), para maior que
- `-ge` (greater than or equal), para maior ou igual
- `-lt` (less than), para menor que
- `-le` (less than or equal), para menor ou igual

Exemplos:

```bash
var=5

# No shell      # Na matemática
[ $var -eq 5 ]  # 5 == 5
[ $var -ne 5 ]  # 5 != 5
[ $var -gt 3 ]  # 5 > 3
[ $var -ge 4 ]  # 5 >= 4
[ $var -lt 4 ]  # 5 < 4
[ $var -le 5 ]  # 5 <= 5
```

Por último, o comando teste permite fazer conjunção, disjunção e negação de expressões com os parâmetros `-a` (AND) e `-o` (OR) e o operador `!`. Assim, é possível montar expressões mais complexas, conforme o exemplo abaixo.

```bash
if [ -n "$nome" -a $valor -gt 1000 -o $valor -lt 500 ]; then
  ...
elif [ ! $valor -eq 10 ]; then
  ...
fi
```

Agora, temos aqui praticamente metade do comando `test` abordado. Em um texto futuro pretendo falar sobre o comando de uma forma mais completa, com mais exemplos e com o resto dos parâmetros para checar informações de arquivos.

Comparação aritmética
---------------------

O shell do Linux, o bash, tem um outro ótimo recurso, específico para a verificação de valores aritméticos, onde é possível usar operadores mais conhecidos para comparação, os mesmos usados nas linguagens C, C++, Java, entre outras. Ele também pode funcionar de duas formas, uma acionando o comando `let` e outra, mais preferível, usando o chamado _comando composto_ do bash, entre `((` e `))`.

No avaliador aritmético não é posto o sinal de `$` no início das variáveis e também é possível realizar pequenos cálculos. Alguns exemplos simples:

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

# com let (vê-se que é menos legível)
if let "var * 3 == 5"; then
  ...
fi
```

Também é possível incrementar e decrementar da mesma maneira de C, inclusive com pré incremento e pré decremento. Estão incluídos os operadores para conjunção e disjunção `&&` e `||`, dando muito mais legibilidade ao script (além de serem mais fáceis de memorizar). Além de tudo, operadores especiais como os de deslocamento de bits (conhecidos também como operadores bitwise) também estão presentes, entre vários outros. Em outro texto, eu também pretendo escrever um pouco mais sobre esse comando do bash.

Comparando strings
------------------

Pode parecer estranho essa seção, já que o comando `test` já faz o trabalho de comparar strings. No entanto o bash fornece um outro comando composto especialmente desenvolvido para strings. Nesse comando, as expressões devem estar entre `[[` e `]]` (dois colchetes de cada lado) e permite, além da simples igualdade de strings (com `==` e `!=`), verificar a ordem lexicográfica das strings, com os operadores `>` e `<`, conforme pode ser visto no exemplo abaixo.

```bash
animal1='cavalo'
animal2='girafa'

# será exibido: cavalo vem antes de girafa
if [[ $animal1 < $animal2 ]]; then
  echo "$animal1 vem antes de $animal2"
else
  echo "$animal1 vem depois de $animal2"
fi
```

Um ponto bastante positivo desse comando é que não é necessário pôr as strings entre aspas.

Mas acredito que a característica mais matadora do comando é a possibilidade de verificar strings com uma expressão regular. Para isso, deve-se usar o operador `=~`, sendo que o lado esquerdo da expressão é a string a ser testada, enquanto a expressão regular se situa no direito, conforme o exemplo abaixo.

```bash
frase='O rato roeu a roupa do rei de roma'

# a expressão será verdadeira, pois está procurando por uma string
# que tenha a palavra "rato" no meio e "roma" no final.
if [[ $frase =~ ^.*rato.*roma$ ]]; then
  ...
fi
```

Finalizando
-----------

Nesse texto foi mostrado três formas de comparação, cada uma com vantagens e desvantagens. Qual usar, vai depender do que se pretende. Mas é importante atentar que esse texto de forma alguma exauriu todas as opções e possibilidades de cada método, esse não foi o propósito, mas apresentar um geral sobre cada um para poder servir de aprendizado para quem está iniciando no shell, bem como servir de referência.

Para quem leu, espero que tenham gostado e deixe comentários, sejam dúvidas, elogios ou críticas. Até a próxima!

<!--
---
title: 'Comparação de valores no Shell Linux'
date: 2012-09-22T19:29:00.000-03:00
draft: false
aliases: [ "/2012/09/comparacao-de-valores-no-shell-linux.html" ]
tags : [linux, bash, shell]
---

#### Demorei pra ler, mas curti bastante. Sempre foi ob...
[Davi Lima](https://www.blogger.com/profile/17986678936031313316 "noreply@blogger.com") - <time datetime="2013-01-02T08:53:20.460-03:00">Jan 3, 2013</time>

Demorei pra ler, mas curti bastante. Sempre foi obscura essa parte do shell pra mim (e mtas outras). Aguardo os próximos artigos, podia comentar aqueles condicionais que verificam se o parâmetro é um arquivo ou diretório. Ou, ainda, explorar mais a passagem de parâmetros e opções default em scripts shell.

Ah, letra cinza é um fundo cinza escuro dificulta a leitura... Troca pra um fundo claro, please :D
<hr />
#### Opa, grande Davi. Obrigado pelo comentário e pela ...
[Wagner Macedo](https://www.blogger.com/profile/06554466576179412927 "noreply@blogger.com") - <time datetime="2013-01-02T18:17:45.034-03:00">Jan 3, 2013</time>

Opa, grande Davi. Obrigado pelo comentário e pela sugestão da cor. Como eu te considero muito, vou mudar imediatamente.

Sobre um novo artigo, está nos meus planos, mas estou sufocado com a vida. Muita, muita coisa para se fazer e sem tempo. Você vende tempo, estou comprando? ;)
<hr />
-->
