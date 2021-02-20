---
title: 'Por que o comando grep se chama assim?'
date: 2014-04-05T05:55:00.000-03:00
draft: false
aliases: [ "/2014/04/por-que-o-comando-grep-se-chama-assim.html" ]
tags : [linux, bash, shell]
---

Provavelmente muitos já ouviram falar algumas histórias sobre a origem do comando `grep`. A mais comum é que significa _Global Regular Expression_, que faz sentido. Em meus estudos recentes sobre conceitos de linguagens de programação eu acabei, por acaso, descobrindo outra história, que tem mais cara de ser a verdadeira.[^1]

Um problema quando era iniciante no Linux era saber o significado dos comandos e o `grep` realmente não tem um nome conotativo. O problema é que seu significado é melhor entendido para quem já usou o editor de textos ed (que nunca usei, mas já ouvi falar).

No ed, o comando **`/regular_expression/`** faz uma busca no texto. Se o precedermos com **`g`**, faz a busca ser global, isto é, no arquivo inteiro, se adicionar ao final um **`p`** isto indica que todas as linhas que casam com a expressão regular devem ser impressas. Assim **`g/regular_expression/p`**, abreviado para `grep` ficou como indicação de buscas em arquivos.

[^1]: SEBESTA, Robert W. **Conceitos de linguagens de programação.** 9. ed. Porto Alegre: Bookman, 2011, p. 32.
