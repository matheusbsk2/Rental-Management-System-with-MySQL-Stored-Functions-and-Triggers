# 🏨 Sistema de Gestão de Aluguéis com MySQL

## 📌 Sobre o Projeto

Este projeto implementa um Sistema de Gestão de Aluguéis utilizando MySQL, com foco na aplicação de regras de negócio diretamente no banco de dados por meio de:

- Stored Functions  
- Triggers  
- Modelagem Relacional  
- Integridade Referencial (Foreign Keys)

O sistema calcula automaticamente descontos com base na duração do aluguel e gera um resumo atualizado automaticamente após cada inserção de novo registro.

---

## 🎯 Objetivos do Projeto

- Demonstrar domínio de SQL avançado
- Implementar regras de negócio dentro do banco
- Automatizar cálculos utilizando funções
- Utilizar triggers para manter consistência de dados
- Estruturar um projeto SQL de forma profissional para portfólio

---

## 🛠 Tecnologias Utilizadas

- MySQL
- SQL (DDL e DML)
- Stored Functions
- Triggers
- Modelagem de Banco Relacional

---

## 🧱 Estrutura do Banco de Dados

### Tabelas principais:

- clientes
- hospedagens
- alugueis
- resumo_aluguel

### Relacionamentos:

- alugueis.cliente_id → clientes.cliente_id
- alugueis.hospedagem_id → hospedagens.hospedagem_id
- resumo_aluguel armazena os valores calculados automaticamente

---

## ⚙ Regras de Negócio Implementadas

### 1️⃣ Cálculo de Desconto por Dias

Função:

CalcularDescontoPorDias(AluguelID INT)

Regras:

- 0 ou inválido → 0%
- 1–2 dias → 5%
- 3–6 dias → 10%
- 7 dias ou mais → 15%

---

### 2️⃣ Cálculo do Valor Final

Função:

CalcularValorFinalComDesconto(AluguelID INT)

Fórmula:

Valor Final = Preço Total - (Preço Total * Desconto / 100)

---

### 3️⃣ Informação do Aluguel

Função:

InfoAluguel(IdAluguel INT)

Retorna:

- Nome do cliente
- Valor da diária calculado

---

### 4️⃣ Automação com Trigger

Trigger:

AtualizarResumoAluguel

Executado automaticamente após cada INSERT na tabela alugueis.

Responsável por:

- Calcular desconto
- Calcular valor final
- Inserir dados na tabela resumo_aluguel

---

## 🗂 Estrutura do Projeto

📂 sistema-aluguel-mysql  
 ├── schema.sql  
 ├── routines.sql  
 ├── trigger.sql  
 ├── seed.sql  
 └── README.md  

---

## 🚀 Como Executar

1. Execute schema.sql  
2. Execute routines.sql  
3. Execute trigger.sql  
4. Execute seed.sql  

---

## 🧪 Exemplos de Teste

SELECT * FROM alugueis;  
SELECT * FROM resumo_aluguel;  

SELECT CalcularDescontoPorDias(1);  
SELECT CalcularValorFinalComDesconto(1);  
SELECT InfoAluguel(1);  

---

## 💡 Conceitos Demonstrados

- Modelagem de banco relacional
- Automação de regras de negócio
- Uso de Stored Functions
- Uso de Triggers
- Integridade referencial
- Organização de projeto SQL para portfólio

---

## 📈 Melhorias Futuras

- Criação de Stored Procedures para relatórios
- Implementação de auditoria
- Otimização com índices
- Integração com API backend
- Dockerização do ambiente

---

## 👨‍💻 Desenvolvedor

Projeto desenvolvido para prática e consolidação de conceitos avançados de SQL e automação no banco de dados.
