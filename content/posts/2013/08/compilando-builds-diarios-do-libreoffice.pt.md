---
title: 'Compilando builds diários do LibreOffice'
date: 2013-08-06T20:03:00.001-03:00
draft: false
aliases: [ "/2013/08/compilando-builds-diarios-do-libreoffice.html" ]
tags : [libreoffice, linux, dica, programação]
---

Já faz algum tempo que quero participar de algum projeto de software livre. Da semana passada para cá eu decidi me juntar ao desenvolvimento do [LibreOffice](http://www.libreoffice.org/).

Primeira tarefa para me tornar um **iniciado**: executar a compilação completa do pacote.

Tamanho da tarefa
-----------------

Para se ter uma ideia, segundo a página do [LibreOffice Brasil](http://pt-br.libreoffice.org/participe/desenvolvimento/) uma compilação completa pode demorar _assustadoras_ 8 horas, com todos os núcleos do processador a 100%.

No meu caso, que o meu computador é um modesto _Core 2 Duo T6600 2.20GHz_ com 4 GB de RAM, demorou quase 5 horas (exatas 4 horas e 52 minutos). Não foi tão ruim, acho que o pessoal usou como base computadores bem mais modestos.

Preparação do ambiente
----------------------

Considerando o meu ambiente, que é um Kubuntu Linux 12.04, eu precisei primeiro baixar as dependências de compilação. Isso é facilmente feito executando no shell:

```console
$ sudo apt-get build-dep libreoffice
```

Isso irá baixar e instalar todas as dependências no sistema, pode demorar um pouco dependendo da sua conexão com a Internet. Instruções para outras distribuições podem ser obtidas no [wiki do LibreOffice](https://wiki.documentfoundation.org/Development/Linux_Build_Dependencies).

Adicionalmente, somente nas distribuições baseadas em Ubuntu, devido à falta do [hamcrest](http://hamcrest.org) no pacote _deb_ do junit, é também preciso baixar o _jar_ oficial, em [http://search.maven.org/remotecontent?filepath=junit/junit/4.9/junit-4.9.jar](http://search.maven.org/remotecontent?filepath=junit/junit/4.9/junit-4.9.jar).

Caso não tenha no seu sistema, também é preciso instalar o cliente `git` para poder baixar o código-fonte do repositório (estou considerando que você tem interesse na última versão disponibilizada pelos desenvolvedores _ontem_). Para isso, execute no shell:

```console
$ sudo apt-get install git-core
```

Baixando o código
-----------------

Baixar o código foi um exercício de paciência. Como eu baixei para desenvolver, foi necessário baixar todo o histórico de desenvolvimento (já que git é um [VCS](http://pt.wikipedia.org/wiki/Sistema_de_controle_de_vers%C3%A3o) distribuído), isso rendeu em torno de 1 GB sem poder continuar de onde parou. Num dia que minha Internet não estava nas suas melhores condições, foi um suplício.

Para baixar o código usando [git](http://git-scm.com/), execute no shell:

```console
$ git clone git://anongit.freedesktop.org/libreoffice/core libreoffice
```

Explicando o comando:

git clone
: Comando do git para copiar o repositório do LibreOffice para o seu computador

git://anongit.freedesktop.org/libreoffice/core
: Endereço do repositório na Internet, usando o protocolo _git_

libreoffice
: Diretório para onde vai a cópia do repositório

Esse processo irá demorar muito. Vá tomar um café, comer um sanduíche ou se exercitar. Ficar sentado o tempo todo faz mal à saúde!

Compilação
----------

O primeiro passo é executar, no shell, estando dento do diretório baixado pelo git (substitua a parte destacada pelo caminho do _jar_ do JUnit):

```console
$ ./autogen.sh --with-junit=<caminho/para/>junit-4.9.jar
```

O `autogen` vai configurar a compilação, que será feita executando:

```console
$ make dev-install
```

Ufa! Agora é só esperar, esperar, esperar... e depois de algumas horas, você terá o mais recente LibreOffice, quentinho, compilado, que pode ser executado chamando:

```console
$ ./install/program/soffice
```

Lembre-se que essa versão não é recomendada para produção. Se for usar para esse propósito, use por sua conta e risco.

Compilando novamente
--------------------

Após poucas horas, alguma modificação já deve ter sido feita no repositório e sua versão recentemente compilada deixará de ser a mais recente. Para poder obter as modificações mais recentes, não é preciso baixar tudo novamente, o git baixa somente as modificações. De forma a fazer isso, execute no shell (para os curiosos o parâmetro `-r` significa _rebase_):

```console
$ git pull -r
```

E depois repita o processo descrito acima, executando o `autogen.sh` e `make`.

Apesar de que para baixar de novo foi muito rápido, o mesmo não se dá com o processo de compilação que irá demorar o mesmo tempo, ou mais, que a primeira vez. Para melhorar essa marca, o wiki do LO recomenda utilizar o _cccache_, um software que faz o cache da compilação do C e C++.

Eu vou escrever um pequeno texto sobre o ccache nos próximos dias, mas adiantando, para ser usado na compilação do LibreOffice não é preciso mudar nada do que foi feito, basta ter o ccache instalado e configurar o tamanho do cache para 32GB. Para isso, execute:

```console
$ sudo apt-get install ccache
$ ccache -M 32G
```

A primeira compilação após a instalação não será rápida, na verdade será até mais lenta, devido ao processo extra de fazer cache. Mas nas seguintes, você economizará algum tempo. No meu caso, a segunda compilação, mesmo com algumas modificações baixadas, durou apenas 44 minutos.

Considerações
-------------

O processo descrito aqui não é para todo mundo, o foco é para quem quer participar no desenvolvimento do LibreOffice, seja escrevendo código ou testando _builds_.

Caso você use o LibreOffice, se envolva para torná-lo ainda melhor 😉
