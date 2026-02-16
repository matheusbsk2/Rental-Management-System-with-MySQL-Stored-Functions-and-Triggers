🏨 Sistema de Gestão de Aluguéis com MySQL (Functions e Triggers)
📌 Visão Geral

Este projeto implementa um Sistema de Gestão de Aluguéis utilizando MySQL, com foco em:

Modelagem relacional

Automação de regras de negócio

Stored Functions

Triggers

Integridade referencial com Foreign Keys

Consistência de dados no banco

O sistema calcula automaticamente descontos com base na quantidade de dias do aluguel e mantém uma tabela de resumo atualizada via trigger.

🛠 Tecnologias Utilizadas

MySQL

SQL (DDL e DML)

Stored Functions

Triggers

Modelagem de Banco de Dados Relacional

🗂 Estrutura do Projeto
📂 sistema-aluguel-mysql
 ├── schema.sql       # Criação do banco e tabelas
 ├── routines.sql     # Funções (regras de negócio)
 ├── trigger.sql      # Trigger de automação
 ├── seed.sql         # Dados de teste
 └── README.md

🧱 Modelagem do Banco
Tabelas principais:

clientes

hospedagens

alugueis

resumo_aluguel

Relacionamentos:

alugueis.cliente_id → clientes.cliente_id

alugueis.hospedagem_id → hospedagens.hospedagem_id

resumo_aluguel armazena os valores calculados automaticamente

⚙ Regras de Negócio Implementadas
📌 1️⃣ Cálculo de Desconto por Dias

Função:

CalcularDescontoPorDias(AluguelID INT)


Regras aplicadas:

Dias de Aluguel	Desconto
0 ou inválido	0%
1–2 dias	5%
3–6 dias	10%
7 dias ou mais	15%
📌 2️⃣ Cálculo do Valor Final

Função:

CalcularValorFinalComDesconto(AluguelID INT)


Fórmula utilizada:

Valor Final = Preço Total - (Preço Total * Desconto / 100)

📌 3️⃣ Informação Detalhada do Aluguel

Função:

InfoAluguel(IdAluguel INT)


Retorna:

Nome do cliente

Valor da diária calculado

📌 4️⃣ Trigger de Atualização Automática

Trigger:

AtualizarResumoAluguel


Executado automaticamente após cada inserção na tabela alugueis.

Ele:

Calcula o desconto

Calcula o valor final

Insere os dados na tabela resumo_aluguel

🚀 Como Executar

Execute os arquivos na seguinte ordem:

1️⃣ schema.sql
2️⃣ routines.sql
3️⃣ trigger.sql
4️⃣ seed.sql

🧪 Consultas de Teste
SELECT * FROM alugueis;
SELECT * FROM resumo_aluguel;

SELECT CalcularDescontoPorDias(1);
SELECT CalcularValorFinalComDesconto(1);
SELECT InfoAluguel(1);

🎯 Competências Demonstradas

Modelagem de banco relacional

Implementação de regras de negócio no banco

Automação com Triggers

Criação de Stored Functions

Integridade referencial com Foreign Keys

Tratamento de casos nulos e inválidos

Organização de projeto SQL para portfólio

📈 Possíveis Melhorias Futuras

Criar Stored Procedures para relatórios

Implementar auditoria de alterações

Adicionar índices para otimização

Integrar com API (Node.js ou Python)

Dockerizar o banco de dados

👨‍💻 Desenvolvedor 

Projeto desenvolvido com foco em automação de regras de negócio no banco de dados e boas práticas em SQL.
