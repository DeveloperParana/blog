---
layout: post
title: "Mais performance com Echo.js"
date: 2015-10-25 22:42:16
image:
description: Ganhe mais performance em sua aplicação utilizando uma simples mini-biblioteca que tem como função atrasar o carregamento das imagens.
tags: javascript performance
categories:
twitter_text: Mais performance com Echo.js
username: Guilherme Bayer
user_description: Developer, i write in Tableless and my blog, moderator at FEMUG Maringá and Devparaná
email: guiilherme.bayer@gmail.com
photo: guilhermebayer.jpg
---

O número de requisições em um site influência muito em sua performance, e você acha que talvez entegramos coisas desnecessárias ao nosso usuário? E um grande responsável por isso são as __imagens__, nem sempre todas visualizadas, mas como podemos diminuir esses números de requests desnecessários?

Basicamente o __Echo.js__ faz o request da imagem só quando ela aparece na área visual do browser, sem a necessidade de fazer todas requisições de uma única vez.

Outra coisa, o __Echo.js__ é puramente em Javascript, nada de jQuery ou outros frameworks. Você encontra o repositório do projeto [aqui](https://github.com/toddmotto/echo), lembrando abra a _Devtools_ e veja a requisições.
[Aqui](http://toddmotto.com/labs/echo/) você encontra um exemplo prático disponibilizado pelo criador do __Echo.js__,e mostra como é fácil de utiliza-lo, apenas passando a utilizar o atributo data-echo para pegarmos o caminho da imagem.

{% highlight html %}
<!-- Utilizando o atributo data-echo="" -->
<img data-echo=”exemplo.png” alt=”Exemplo”>
{% endhighlight %}

Há outras maneiras de melhorarmos a performance do nosso site em relação a imagens como css sprites, minificar imagens, mas e você, já utilizou essa?
