---
title: 'Utilitário: Monitor and Run'
date: 2013-02-24T04:03:00.001-03:00
draft: false
aliases: [ "/2013/02/utilitario-monitor-and-run.html" ]
tags : [python, dica, programação]
---

Olá pessoal,

Escrevi um pequeno programa em Python chamado `monrun` para resolver um pequeno probleminha meu e resolvi compartilhar.

Para que serve?
---------------

É a pergunta que não cala. Ele serve para executar um comando toda vez que um arquivo foi modificado, simplesmente.

E para que eu quero isso?
-------------------------

Bom, a utilidade depende da pessoa. Para mim, pessoalmente, eu às vezes utilizo [LaTeX](http://pt.wikipedia.org/wiki/LaTeX) para escrever textos mais profissionais.

No uso do LaTeX é preciso, para ver o resultado do texto formatado, fazer a compilação para gerar PDF e eu acho chato ter que ficar alternando a minha janela o tempo todo para executar o comando. Sei que existem ambientes para usar LaTeX, mas eu normalmente escrevo o texto usando [Markdown](http://pt.wikipedia.org/wiki/Markdown) e converto para LaTeX através de um utilitário chamado [pandoc](http://johnmacfarlane.net/pandoc/) (fica a dica). Mas, mesmo que fosse apena com LaTeX, a vantagem de usar o `monrun`, para mim, ao menos, é ficar independente de ambiente.

Uau, eu quero
-------------

Estou publicando o código no github em [https://github.com/wagnerluis1982/monrun](https://github.com/wagnerluis1982/monrun). Está tudo em inglês para deixar aberta a possibilidade de voluntários de qualquer lugar.

Como usar?
----------

Usando o README do projeto, a forma mais simples de usar é executando

```console
$ python monrun.py -c <COMANDO> <ARQUIVO>
```

se quiser que o comando seja executado uma vez antes de iniciar o monitoramento, use a chave `-b` (de _before_) como a seguir

```console
$ python monrun.py -b -c <COMANDO> <ARQUIVO>
```

Uma chave `-a` (de _after_) também está disponível para sobrepôr um `-b` anterior ou vice versa.

Conclusão
---------

O uso que estou dando ao programa é o de compilar um arquivo LaTeX sempre que há mudanças. Mas pode haver vários outros usos, como uma mudança em um arquivo de Log, por exemplo.

E claro que ainda há muita coisa que pode ser melhorado como poder dizer de quanto em quanto tempo a mudança será verificada (atualmente é fixo em 1 segundo) e também a habilidade de monitorar mais de um arquivo ou mesmo um diretório. A mudança do tempo é muito simples e nos próximos dias, assim que eu tiver tempo eu já realizo essa alteração, já a outra demanda um pouco mais de tempo.

Se achar o programa util para você e querer melhorar, fork o projeto no github e faça um Pull Request. Mas se não tem conta no github nem quer ter, mande para mim via comentário mesmo (o projeto é de código aberto).

<!--
---
title: 'Utilitário: Monitor and Run'
date: 2013-02-24T04:03:00.001-03:00
draft: false
aliases: [ "/2013/02/utilitario-monitor-and-run.html" ]
tags : [python, dica, programação]
---

#### Vale conhecer o watchdog, feito em Python, com a m...
[Davi Lima](https://www.blogger.com/profile/17986678936031313316 "noreply@blogger.com") - <time datetime="2013-02-24T06:42:25.002-03:00">Feb 0, 2013</time>

Vale conhecer o watchdog, feito em Python, com a mesma finalidade, monitorar o filesystem por mudanças. Conheci através do Plone, onde ele é usado para tornar o desenvolvimento mais ágil, reiniciando a instância do Zope quando há modificações nos arquivos Python ou ZCML.

https://github.com/gorakhargosh/watchdog

De toda forma, parabéns pelo projeto. Deve ter aprendido bastante coisa no caminho.
<hr />
#### O watch resolve isso :)
[Felipe](https://www.blogger.com/profile/16078464002863377156 "noreply@blogger.com") - <time datetime="2013-02-24T10:30:18.429-03:00">Feb 0, 2013</time>

O watch resolve isso :)
<hr />
#### Grande Davi! É, eu imaginava haver algo assim, ma...
[Wagner Macedo](https://www.blogger.com/profile/06554466576179412927 "noreply@blogger.com") - <time datetime="2013-02-24T18:56:58.615-03:00">Feb 0, 2013</time>

Grande Davi!

É, eu imaginava haver algo assim, mas tava com preguiça de pesquisar e (você adivinhou) estava querendo aprender um pouco mais.

Vou dar uma olhada no watchdog, quem sabe eu consiga adicionar algo ao projeto :), obrigado pela sugestão!
<hr />
#### Que watch? Se for o utilitário do unix (também pre...
[Wagner Macedo](https://www.blogger.com/profile/06554466576179412927 "noreply@blogger.com") - <time datetime="2013-02-24T19:00:05.976-03:00">Feb 0, 2013</time>

Que watch? Se for o utilitário do unix (também presente no Linux), ele não serve para esses propósitos...
<hr />
#### Opa, Davi. Acabei de olhar o watchdog e, olhando, ...
[Wagner Macedo](https://www.blogger.com/profile/06554466576179412927 "noreply@blogger.com") - <time datetime="2013-02-24T19:07:18.035-03:00">Feb 0, 2013</time>

Opa, Davi. Acabei de olhar o watchdog e, olhando, por alto (bem por alto mesmo), eu acho que ele não faz a verificação do conteúdo do arquivo.

No monrun eu montei o seguinte algoritmo para identificar diferenças:
\- verifica mtime
\- se mtime diferente, verifica tamanho
\- se tamanho igual, verifica md5

Dessa forma, o comando só será executado mesmo se o arquivo foi modificado.
<hr />
-->
