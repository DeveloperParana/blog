---
layout: post
title: "Manipulando o uso de classes com classList API"
date: 2016-10-07 19:15:03
image: '/assets/img/blog-image.png'
description:
tags: javascript 
categories:
twitter_text: Manipulando o uso de classes com classList API
username: Guilherme Bayer
user_description: Developer, i write in Tableless and my blog, moderator at FEMUG Maringá and Devparaná
email: guiilherme.bayer@gmail.com
photo: guilhermebayer.jpg
---

Uma tarefa muito simples de se fazer com o JQuery, é a troca e manipulação de classes nos elementos HTML. Talvez você não saiba, mas é tão fácil quanto fazer essas manipulações usando JavaScript puro. Para tanto, vamos usar a API classList do JavaScript. Assim como as conhecidas funções `addClass()`, `removeClass()`, `hasClass()` e o `toggleClass()` do nosso conhecido Jquery, possuímos métodos nativos que executam a mesma função.

## Métodos do classList

O classList conta com os seguinte métodos:

```javascript
add('class');
remove('class');
contains('class');
item(index);
toggle('class');
length;
```
`add()`, adiciona uma ou mais classes ao elemento.

```javascript
var el = document.querySelector('element');
el.classList.add('classOne', 'classTwo');
console.log(el.classList); // ["classOne", "classTwo", value: "classOne classTwo"]
```

`remove()`, remove uma ou mais classes do elemento.

```javascript
el.classList.remove('classOne');
console.log(el.classList); // [ "classTwo", value: "classTwo"]
```

`contains()`, verifica se possui certa classe no elemento.

```javascript
if(el.classList.contains('classFour') == true) 
console.log('Não possui a classe!'); // Não possui a classe!
```

`item()`, retorna a classe que se encontra naquele índice.

```javascript
el.classList.item(0);
console.log(el.classList.item(0)); // classTwo
```

`toggle()`, se a classe existir naquele elemento, ele a remove, se não existir ele a adiciona.

```javascript
el.classList.toggle('classThree')
console.log(el.classList); // ["classTwo", "classThree", value: "classTwo classThree"]

el.classList.toggle('classThree')
console.log(el.classList); // ["classTwo", value: "classTwo"]
```

`length`, retorna a quantidade de classes naquele elemento.

```javascript
el.classList.length;
console.log(el.classList.length); // 2
```

## Quanto ao suporte
A classList API possui um excelente suporte aos browsers modernos, e apenas o internet explorer com suporte a versão +10, para algo mais detalhado, [http://caniuse.com/#feat=classlist](http://caniuse.com/#feat=classlist)