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

CalcularD
