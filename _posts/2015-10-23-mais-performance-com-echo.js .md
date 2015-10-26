---
layout: post
title: "Mais performance com Echo.js"
date: 2015-10-25 22:42:16
image: '/assets/img/'
description: Ganhe mais performance em sua aplicação utilizando uma simples mini-biblioteca que tem como função atrasar o carregamento das imagens.
tags: javascript, performance
categories: javascript, performance
twitter_text: Mais performance com Echo.js
username: Guilherme Bayer
user_description: Desenvolvedor FrontEnd
email: guiilherme.bayer@gmail.com
photo: guilhermebayer.jpg
---

O número de requisições em um site influencia muito em sua performance, e você acha que talvez integramos coisas desnecessárias ao nosso usuário? e um grande responsável por isso são as imagens, nem sempre todas visualizadas, mas como podemos diminuir esses números de requests desnecessários? Basicamente o Echo.js faz o request da imagem só quando ela aparece na área visual do browser, sem a necessidade de fazer todas requisições de uma única vez.


Outra coisa, o Echo.js é puramente em Javascript, nada de jQuery ou outros. Você encontra o repositório do projeto [aqui](https://github.com/toddmotto/echo), lembrando abra a Devtools e veja a requisições.
[Aqui](http://toddmotto.com/labs/echo/) você encontra um exemplo prático disponibilizado pelo criador do Echo.js,e mostra como é fácil de utiliza-lo, apenas passando a utilizar o atributo data-echo para pegarmos o caminho da imagem.


```html
<!-- Utilizando o atributo data-echo="" -->
<img data-echo=”exemplo.png” alt=”Exemplo”>
```


Há outras maneiras de melhorarmos a performance do nosso site em relação a imagens como css sprites, minificar imagens, mas e você, já utilizou essa?