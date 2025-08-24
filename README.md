<h1>Event Driven with RabbitMQ</h1>

###

<p>Projeto aplicando conceitos de EDA utilizando RabbitMQ como broker de mensagens</p>

###

<p>Para executar:
  <br>docker compose up<br>
  <br>Serão criados dois serviços:<br>
  rabbit -> container rodando o broker<br>
  web -> container rodando a aplicação
</p>

###

<p>
  Aplicação consiste em um crud de Produtos (criado utilizando Turbo Frame) e Orçamentos
  <br>Toda vez que um orçamento tem seu status alterado para submitted, é produzido uma mensagem para o broker, a qual é consumida e altera o status do orçamento para approved ou rejected.
  <br>Simulando um fluxo onde uma terceira aplicação faz esse controle de aprovação
</p>

*O consumidor das mensagens roda em um processo executado pelo Procfile (essa parte será melhorada)

###
