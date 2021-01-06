---
title: 'Apresentando o projeto GVAL'
date: 2012-10-01T10:01:00.000-03:00
draft: false
aliases: [ "/2012/10/apresentando-o-projeto-gval.html" ]
tags : [gval]
---

Quero, nessa publicação, apresentar o projeto GVAL (Gerador e Verificador de Apostas da Loteria). É isso mesmo, é um pequeno sistema que gera números para apostas e confere apostas da loteria. Esse é um projeto pessoal que estou tocando no meu tempo livre. Ainda está em estágio _alpha_, isto é, ainda pode conter bugs e nem todas as funcionalidades estão disponíveis (uma delas é a geração de números para apostas).

Eu comecei esse projeto porque eu achava um saco (ainda acho) fazer conferências de apostas da loteria na mão, correndo o risco de não conferir direito e derradeiramente perder o prêmio. Bom, eu aposto praticamente toda semana, nunca perco a fé de um dia ganhar na loteria, assim, ganhei um tempo de ouro não precisando conferir manualmente.

O projeto foi escrito em Python e roda apenas na linha de comando (por enquanto), de forma não interativa. Para instalar, a única dependência é o [PyYAML](http://pyyaml.org/wiki/PyYAML), além do **setuptools** (normalmente presente em todas as instalações de Python, no Linux). Caso as dependências já estejam satisfeitas, basta instalar da forma tradicional, baixando o arquivo do projeto, descompactar e executar dentro do diretório destino:

```console
$ python setup.py install
```

Depois da instalação, se o PATH estiver correto, poderá ser executado o script `gval`. O script atualmente faz dois comandos: **`consultar`** e **`conferir`**, conforme exemplos abaixo.

Consultando o resultado de um jogo.

```console
$ gval consultar --jogo lotofacil --concurso 708
Resultado da Lotofacil 708
  Números: 01 02 03 04 05 06 09 11 14 16 19 21 22 24 25
```

Por enquanto, o resultado só retorna números. Em breve vai mostrar mais informações. Eu criei esse comando para acessar mais rápido um resultado, assim não preciso abrir um browser, entrar no site da lotérica, procurar o jogo e concurso desejado. Assim é muito mais rápido. Sei que a linha de comando assusta para quem não tem costume, mas tem suas vantagens.

Para conferir uma aposta:

```console
$ gval conferir --jogo quina --concurso 805 --aposta "13 22 42 55 59"
Conferência da Quina 805
  1 apostas premiadas (em 1 conferidas)
  Premiação total: R$ 33,13
```

Uma opção legal do comando conferir e poder conferir mais de um concurso e mais de uma aposta de uma vez só, cruzando-os. Por exemplo, se eu informar 3 concursos e 4 apostas, eu irei conferir na verdade 12 apostas. Segue um exemplo simples:

```console
$ gval conferir --jogo quina --concurso 805 --concurso 806 --aposta "13 22 42 55 59"
Conferência da Quina 805 e 806
  1 apostas premiadas (em 2 conferidas)
  Premiação total: R$ 33,13
```

Para mais informações, visite [https://github.com/wagnerluis1982/gval](https://github.com/wagnerluis1982/gval). Nesse link, está disponível o download do GVAL, inclusive com um instalador para Windows (mas que não instala as dependências). O projeto é livre e código aberto. Se você é programador e tiver interesse no projeto, faça um fork no GitHub e me mande um Pull Request.

Por fim, espero que o projeto seja útil. Está sendo para mim.
