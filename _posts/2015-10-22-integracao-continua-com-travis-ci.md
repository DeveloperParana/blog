---
layout: post
title: "Integração contínua com travis-ci"
date: 2015-10-22 22:42:16
image: '/assets/img/'
description: Veja como em poucos passos é possivel integrar seu projeto no travis-ci
tags: ci
categories:
twitter_text: Integração contínua com travis-ci
username: Renan Martins Pimentel
user_description: Café!
email: renan.pimentel@gmail.com
photo: renanmpimentel.jpg
---

Nesse post vou mostrar como é simples integrar o seu [github](http://www.github.com) ao [travis-ci](https://travis-ci.org/), uma ferramenta de integração contínua online e __gratís__.

> Continuous Integration is a software development practice where members of a team integrate their work frequently, usually each person integrates at least daily - leading to multiple integrations per day. Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible. Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly. This article is a quick overview of Continuous Integration summarizing the technique and its current usage.

> _Martin Fowler - 1 May 2006_
[Link completo](http://martinfowler.com/articles/continuousIntegration.html).

Então vamos por a mão na massa, e ver como as coisas funcionam.

## Travis-CI

Acesse o site do [travis-ci](https://travis-ci.org/) e faça o login com o seu usuário do __github__

![Travis-CI](/assets/img/posts/integracao-continua/img01.jpg)

Feito isso, você vai ver a tela com suas ultimas integrações:

![Travis-CI](/assets/img/posts/integracao-continua/img02.jpg)

Caso você não tenha nenhum, você pode adicionar qualquer projeto do seu __github__, para acessar o seu perfil
> https://travis-ci.org/profile/_<USER_GITHUB>

![Travis-CI](/assets/img/posts/integracao-continua/img03.jpg)

Vai ter a lista completa de todos os seus projetos, basta clicar em _ON_ e depois na _chave inglesa_ do lado do _ON_, esse link, irá nos levar a pagina de configuração.

![Travis-CI](/assets/img/posts/integracao-continua/img04.jpg)

Temos três opções na tela:

- __Build only if .travis.yml is present:__ Esse vem como off por padrão, pois ainda não criamos o arquivo _.travis.yml_, vamos falar dele já já.
- __Build pushes:__ Toda vez que for feito um push, ele vai gerar um novo _build_
- __Build pull requests:__ Toda vez que for feito um pull request, ele vai gerar um novo _build_

Ative a primeira, opção, e vamos criar o arquivo _.travis.yml_, e comitar para o repositório. Aqui como estamos fazendo em um projeto _nodejs_, vamos configurar o arquivo para esse padrão, mas na documentação oficial, é possivel encontrar o [suporte para outras linguagens](http://docs.travis-ci.com/user/getting-started/).

O arquivo em __nodejs__ vai ficar assim:

{% highlight text %}
language: node_js
node_js:
  - "0.11"
{% endhighlight %}

Vocẽ pode validar o seu arquivo, [aqui](http://lint.travis-ci.org/)

![Travis-CI](/assets/img/posts/integracao-continua/img05.jpg)

Arquivo criado/validado e feito o commit para o seu repositório, o projeto estará com integração feita.O resultado esperado deve ser esse:

![Travis-CI](/assets/img/posts/integracao-continua/img06.jpg)

Pronto, agora o seu projeto já pode ter a _Badge_ de _build status_

[![Build Status](https://travis-ci.org/renanmpimentel/nodejs-boilerplate.svg)](https://travis-ci.org/renanmpimentel/nodejs-boilerplate)

Claro, que este foi um exemplo __muito simples__ de integração contínua, ele pode ser muito personalizado de acordo com suas necessidades, veja por exemplo, o arquivo _.travis.yml_ do [Bootstrap](http://getbootstrap.com/):

{% highlight text %}
language: node_js
git:
  depth: 10
node_js:
  - "0.10"
before_install:
  - travis_retry sudo pip install -r test-infra/requirements.txt
  - rvm use 1.9.3 --fuzzy
  - export GEMDIR=$(rvm gemdir)
  - if [ "$TWBS_TEST" = validate-html ]; then echo "ruby=$(basename $GEMDIR) jekyll=$JEKYLL_VERSION rouge=$ROUGE_VERSION" > pseudo_Gemfile.lock; fi
  - "export TRAVIS_COMMIT_MSG=\"$(git log --format=%B --no-merges -n 1)\""
  - echo "$TRAVIS_COMMIT_MSG" | grep '\[skip validator\]'; export TWBS_DO_VALIDATOR=$?; true
  - echo "$TRAVIS_COMMIT_MSG" | grep '\[skip sauce\]'; export TWBS_DO_SAUCE=$?; true
  - if [ "$TRAVIS_REPO_SLUG" = twbs-savage/bootstrap ]; then export TWBS_DO_VALIDATOR=0; fi
install:
  - npm install -g grunt-cli
  - ./test-infra/s3_cache.py download npm-modules
  - if [ "$TWBS_TEST" = validate-html ] && [ $TWBS_DO_VALIDATOR -ne 0 ]; then ./test-infra/s3_cache.py download rubygems; fi
after_script:
  - if [ "$TRAVIS_REPO_SLUG" != twbs-savage/bootstrap ] && [ "$TWBS_TEST" = core ]; then ./test-infra/s3_cache.py upload npm-modules; fi
  - if [ "$TRAVIS_REPO_SLUG" != twbs-savage/bootstrap ] && [ "$TWBS_TEST" = validate-html ] && [ $TWBS_DO_VALIDATOR -ne 0 ]; then ./test-infra/s3_cache.py upload rubygems; fi
env:
  global:
    - JEKYLL_VERSION="2.5.3"
    - ROUGE_VERSION="1.7.7"
    - SAUCE_USERNAME="bootstrap"
    - secure: "pJkBwnuae9dKU5tEcCqccfS1QQw7/meEcfz63fM7ba7QJNjoA6BaXj08L5Z3Vb5vBmVPwBawxo5Hp0jC0r/Z/O0hGnAmz/Cz09L+cy7dSAZ9x4hvZePSja/UAusaB5ogMoO8l2b773MzgQeSmrLbExr9BWLeqEfjC2hFgdgHLaQ="
    - secure: "gqjqISbxBJK6byFbsmr1AyP1qoWH+rap06A2gI7v72+Tn2PU2nYkIMUkCvhZw6K889jv+LhQ/ybcBxDOXHpNCExCnSgB4dcnmYp+9oeNZb37jSP0rQ+Ib4OTLjzc3/FawE/fUq5kukZTC7porzc/k0qJNLAZRx3YLALmK1GIdUY="
    - secure: "Gghh/e3Gsbj1+4RR9Lh2aR/xJl35HWiHqlPIeSUqE9D7uDCVTAwNce/dGL3Ew7uJPfJ6Pgr70wD3zgu3stw0Zmzayax0hiDtGwcQCxVIER08wqGANK9C2Q7PYJkNTNtiTo6ehKWbdV4Z+/U+TEYyQfpQTDbAFYk/vVpsdjp0Lmc="
    - secure: "RTbRdx4G/2OTLfrZtP1VbRljxEmd6A1F3GqXboeQTldsnAlwpsES65es5CE3ub/rmixLApOY9ot7OPmNixFgC2Y8xOsV7lNCC62QVpmqQEDyGFFQKb3yO6/dmwQxdsCqGfzf9Np6Wh5V22QFvr50ZLKLd7Uhd9oXMDIk/z1MJ3o="
    - secure: "RKWpS+P20b4tG9tawzCMJSmQftoonmC7tJzyGYiHuEM1TcpHALLBcnzKlr/+DiPTfzDJWY4kS8pxfhK4uXOe8OHnhpMNub7LEWtFPePlZIervOJcsOydaQocTKqVVWD6OUubMeQmQ+tZmvmpjoJ1uPPEbFs9ciF7+dv3U5tLUZ0="
    - secure: "XswSKBY0HJ/aO9VOBeWlvGpqSFF/DsJmNKz7o5RkJMJX340qe44J929uUNwwOwlv9YrgptzC2W6l8bpmZQV+p6IYs99SoSA8CCaUfIJaqeU9x/UiT5vIHgqaNax+vFJwvzHLpF5v/ggFqFEKCd54gCDasePLTztHeC4oL104iaQ="
    - secure: "Dv1HX5dzyTh8gA2YsLI+yWEgh9lnGKPpRDDEYYvm42fjBFziUYfcpvA9g8GXQuU9srY3mhfsZkCDHN0x5n1gliOai5TSjmd5Hh+9UyhvNWE+D8HoUpcFXWoQXvy/if2r25m+ZWi3cqgXkkBOcal3W1ePMtU4ln18NcWyIZ0tEFo="
    - secure: "PabpUdG2dE40hHUkMCdxk1e9Ak3BOo0h7Y5/uekosLKOz5N60Xmn/ooyrSkvicLthXO4cfONFhO3/xSVRKQOxlUw4on5i0VuNK+QSqxJk0IDaRSZnTCcC8J7083K0YL+FvMdGQwcYwMY9LiwS8aS014IRkSQjsa+mjo3owP+dOU="
    - secure: "G4/f4PVyVi9o6UbZMqw9YFmDu7cHqe9iymiXYd1RcnPXwhWAePX12m0PWMhUj5itJ180PTEddVip8PNOgBdqyrDxEPKkcgAW2EElVAPIKJXVfvDW64UjQ0H7NS7XvF7iLQUJp/XfmR7NJ7tT393AQdh8SGmuQpJhgYbwIWbES/k="
  matrix:
    - TWBS_TEST=core
    - TWBS_TEST=validate-html
    - TWBS_TEST=sauce-js-unit
matrix:
  fast_finish: true
notifications:
  slack: heybb:iz4wwosL0N0EdaX1gvgkU0NH
  webhooks:
    - http://savage.twbsapps.com/savage/travis
{% endhighlight %}

Qualquer dúvida, deixa um comentário e/ou dá uma olhadinha na [documentação oficial](http://docs.travis-ci.com/). Espero que tenham gostado, até o próximo!
