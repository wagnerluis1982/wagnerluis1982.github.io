---
title: 'Estrutura try..finally'
date: 2012-10-09T11:23:00.000-03:00
draft: false
aliases: [ "/2012/10/estrutura-tryfinally.html" ]
tags : [dica, programação, java]
---

O controle de exceções é um recurso fundamental na Programação Orientada a Objetos. Geralmente usamos o famoso `try..catch` para controlar as exceções no Java ou em outras linguagens que adotam a POO (com notações levemente diferentes).

```java
// try..catch em Java
try {
  ...
} catch (Exception e) {
  ...
}
```

Mas, geralmente, quando estamos criando métodos, muitas vezes queremos que as exceções sejam lançadas para fora, assim usamos o `try..catch` e relançamos a exceção no bloco `catch`. Acho que isso não é nenhuma surpresa.

```java
// relançando a exceção
try {
  ...
} catch (Exception e) {
  throw e;
}
```

No entanto, há momentos em que estamos trabalhando com algo sensível, como abrindo arquivos, abrindo conexão com banco de dados, criando arquivos temporários, entre outros, que precisamos usar o bloco `finally`, mas ao mesmo tempo queremos que a exceção seja relançada, daí normalmente usamos o bloco `try..catch..finally`. Isso também não deve ser nada novo.

```java
// try..catch..finally
try {
  ...
} catch (Exception e) {
  throw e;
} finally {
  file.delete()
}
```

A surpresa, para mim, pelo menos, foi que também existe o bloco `try..finally`, sem o catch, mas que funciona da mesma forma que esse último. Claro considerando que dentro do catch só haja a instrução de relançamento da exceção.

```java
// try..finally
try {
  ...
} finally {
  file.delete()
}
```

Por fim, acredito que muitas outras linguagens também permitem utilizar esse "atalho". Ao menos no Python funciona, testei e comprovei.

<!--
---
title: 'Estrutura try..finally'
date: 2012-10-09T11:23:00.000-03:00
draft: false
aliases: [ "/2012/10/estrutura-tryfinally.html" ]
tags : [dica, programação, java]
---

#### Try...catch é bom para proteger contra erro, mt bo...
[RobertoBrandini](https://www.blogger.com/profile/03017592025477941747 "noreply@blogger.com") - <time datetime="2012-10-12T10:43:15.555-03:00">Oct 5, 2012</time>

Try...catch é bom para proteger contra erro, mt bom.
<hr />
#### É verdade, mas se ligue que o try..finally não pro...
[Wagner Macedo](https://www.blogger.com/profile/06554466576179412927 "noreply@blogger.com") - <time datetime="2012-10-12T16:21:47.897-03:00">Oct 5, 2012</time>

É verdade, mas se ligue que o try..finally não protege contra erros. Como foi dito, é uma forma de relançar a exceção sem perder a possibilidade de executar um "finalmente".
<hr />
-->
