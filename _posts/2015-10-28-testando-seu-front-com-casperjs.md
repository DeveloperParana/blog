---
layout: post
title: "Testando seu front com CasperJs"
date: 2015-10-28 02:00:00
image: '/assets/img/'
description: ''
tags: teste frontend casperjs javascript
categories: testes frontend
twitter_text: Teste seu front com javascript
username: Fernando Fabricio dos Santos
user_description: Entusiasta de metodologias ágeis e software bem desenvolvido!
email: ferfabricio@gmail.com
photo: ferfabricio.jpg
---

Todo delivery de software tem o propósito de adicionar novas funcionalidades, comportamentos ou corrigir um bug. Não é a intenção de nenhum desenvolvedor entregar novos bugs em produção para manter o emprego, se você faz isso propositalmente está na hora de trabalhar em outro lugar ou outra área!

Um ponto crucial em toda entrega é a validação. Certificar que não comprometeu nenhuma funcionalidade, que todos os fluxos existentes possam ser realizados e de que o item entregue esteja funcionando, são vários pontos a se preocupar num momento crítico.

Existem várias formas de realizar tal validação dentre as quais a mais utilizada é a exploração manual, algumas vezes seguindo um roteiro parecido com este:

    1 - Entregar alterações
    2 - Reproduzir todos os fluxos existentes possíveis (os que você se lembra)
    3 - Testar as novas funcionalidades
    4 - Desligar o telefone e ir correndo para casa torcendo para não ter passado nenhum bug

Eu não acredito que este seja um fluxo adequado de trabalho ou que nunca irá ter problemas com ele. Se você o utiliza e nunca teve problema por favor me avise, quero conhecer seus passos ninja.

Para evitar trabalho manual recomendo AUTOMATIZAR seus processos. Vou demonstrar algumas automações simples utilizando a biblioteca CasperJS.

Estou considerando que você tenha o Node.js e o CasperJS devidamente instalados e funcionando. Caso não tenha por favor olhe nos seguintes links as instruções para tal: [Node.js](https://nodejs.org/download/) e [CasperJS](http://docs.casperjs.org/en/latest/installation.html).

Vamos trabalhar em baby steps.

## Primeiro caso de teste

No primeiro caso de teste quero abrir meu blog e verificar se o título (tag h1) contém meu nome, então pensando nisso posso estabelecer as seguintes regras:

    1 - Ao abrir receber um HTTP Code 200
    2 - O título da página conter: Fernando Fabricio
    3 - O conteúdo da tag H1 ser igual a: Fernando Fabricio

Primeiro passo é criar o caso de teste:

{% highlight javascript %}
casper.test.begin('Abrir blog', 1, function (test){

});
{% endhighlight %}

CasperJS não é utilizado somente para testes, entao dentro do objeto do **casper** temos um parâmetro com a instância do executor dos testes.
Este parâmetro pode ser visto em ação na linha 1 quando utilizamos o método **casper.test.begin**.

O método begin possui 4 assinaturas, deve ser escolhida a mais adequada ao teste a ser realizado:

{% highlight javascript %}
begin(String description, Number planned, Function suite)
begin(String description, Function suite)
begin(String description, Number planned, Object config)
begin(String description, Object config)
{% endhighlight %}

No exemplo utilizei a primeira assinatura, os parâmetros são auto explicativos.

Para executar o teste temos um método chamado **run()**, ele aceita dois parâmetros. O primeiro deve ser uma função com a execução final do seu teste (onComplete) e o segundo parametro é a quantidade de segundos a ser esperada para timeout, ele pode ser ignorado caso queira utilizar configuração padrão.

{% highlight javascript %}
casper.test.begin('Abrir blog', 1, function (test){
    casper.run(function(){
        test.done();
    });
});
{% endhighlight %}

A execução final do método **run()** deve conter uma chamada para finalizar os testes, no caso o callback **test.done()**.

Próximo passo é configurar e iniciar a navegação com o método **start**. Os parâmetros deste método são a URL e uma função de execução (then) a qual vai conter as ações a serem tomadas no teste e asserções.

{% highlight javascript %}
casper.test.begin('Abrir blog', 1, function (test){
    casper.start('http://blog.fabricio.inf.br', function(){

    });
    casper.run(function(){
        test.done();
    });
});
{% endhighlight %}

Finalizando o primeiro teste vamos realizar as asserções que definimos em nosso caso de teste.

{% highlight javascript %}
casper.test.begin('Abrir blog', 3, function (test){
    casper.start('http://blog.fabricio.inf.br', function(){
        test.assertHttpStatus(200);
        test.assertTitle('Fernando Fabricio');
        test.assertEquals(this.getHTML('#header-inner > div.titlewrapper > h1'), "\nFernando Fabricio\n");
    });

    casper.run(function(){
        test.done();
    });
});
{% endhighlight %}

Para executar o seu teste digite no terminal: **casperjs test yourtestfile.js**

O resultado deve ser algo como:

![Result](/assets/img/posts/testando-frontend/test_result.png)

O código fonte dos exemplos deste post podem ser obtidos em: [https://github.com/ferfabricio/casperjs-test-example](https://github.com/ferfabricio/casperjs-test-example)
