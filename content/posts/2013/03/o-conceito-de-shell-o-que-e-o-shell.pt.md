---
title: 'O conceito de shell / O que é o shell'
date: 2013-03-03T02:08:00.003-03:00
draft: false
aliases: [ "/2013/03/o-conceito-de-shell-o-que-e-o-shell.html" ]
tags : [linux, bash, shell]
---

Existem muitos sites que abordam o mesmo que eu nesse _post_. E porque eu tô escrevendo um mais do mesmo? Porque considero o meu ponto de vista bom o suficiente para registrar.

Primeiramente, é interessante entender qual o significado da palavra **shell**. Entre outros significados do [dicionário](http://michaelis.uol.com.br/moderno/ingles/index.php?lingua=ingles-portugues&palavra=shell), significa _parte externa_, _casca_ ou _concha_.

Antes de aumentar o blá blá blá sobre os significados, o shell que eu estou abordando aqui é o shell usado nos sistemas tipo unix (Linux, AIX, Solaris, MacOS, etc) como a interface de comandos. Vou usar, para explicar, o Linux, que desses sistemas é o que tenho mais intimidade.

No sistema operacional Linux existe o _kernel_ ou núcleo do sistema. O kernel, a grosso modo, é quem faz todo o trabalho de fazer o seu hardware funcionar, isto é, sem ele você não conseguiria ouvir sons e ver vídeos no seu computador de forma tão fácil. Se não tivéssemos um kernel, toda vez que quiséssemos ouvir um som, teríamos que ver se a placa de som poderia processar aquele dado, traduzir o arquivo MP3 para um formato que pode ser processado por ela, etc. Isso é bem complicado de entender mesmo, mas não vou me estender nisso, senão não abordo o assunto principal.

Como eu disse, o kernel faz todo esse trabalho de comunicação com o hardware. Mas você não pode usar seu computador mexendo diretamente com ele. É preciso algo que seja uma interface com o usuário, que no caso do Linux, é o shell.

{{< figure src="https://www.shellscript.com.br/img/capa.jpg" width="200"
           link="https://www.shellscript.com.br/" target="_blank"
           title="Shell Script Profissional"
           alt="Capa do livro Shell Script Profissional. Vê-se uma grande concha." >}}

Voltando aos significados do Michaelis, acho que agora dá pra entender o porque desses significados. O shell é a **parte externa**, pois o kernel, que é o núcleo, está dentro. O shell é a **casca**, porque é a parte que nós usuários podemos ver. O shell é uma **concha**, já que a concha fica fechada protegendo a parte de dentro.

A parte da concha é engraçada. Mas para ver que é válida, um grande especialista em shell chamado [Aurélio Marinho Jargas](http://aurelio.net/) publicou seu livro [Shell Script Profissional](http://www.shellscript.com.br/) onde na capa tem uma concha.

Resumindo, **shell** é a interface com o usuário, é o caminho que o usuário do Linux tem para usar o seu computador. Não confunda com interface gráfica (essa é um dos tipos). Não sei se ficou muito claro para vocês. Talvez eu não tenha sido muito claro em algum ponto. Caso tenha alguma dúvida, deixe nos comentários.

E caso queira aprender a usar o shell, recomendo fortemente [Papo de Botequim do Júlio Neves](http://www.apoie.org/JulioNeves/) (acredito ser o maior especialista em shell no Brasil -- e com reconhecimento internacional). Até a próxima.
