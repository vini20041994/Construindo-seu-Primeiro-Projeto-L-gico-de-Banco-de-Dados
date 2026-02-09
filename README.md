# 📦 Projeto de Banco de Dados – E-commerce (Modelo Lógico)

## 📌 Descrição do Projeto

Este projeto apresenta a **modelagem lógica de um banco de dados relacional para um cenário de e-commerce**, desenvolvida a partir de um **modelo conceitual EER (Diagrama Entidade-Relacionamento Estendido)**.

O objetivo é aplicar corretamente os conceitos de **modelagem conceitual**, **mapeamento para o modelo lógico**, **criação do esquema SQL**, **persistência de dados** e **elaboração de consultas SQL**, conforme boas práticas acadêmicas e profissionais.

O projeto foi desenvolvido como parte de um **desafio prático de banco de dados**, com foco em organização, integridade dos dados e consultas analíticas.

---

## 🎯 Objetivos

- Aplicar conceitos de modelagem EER  
- Mapear o modelo conceitual para o modelo lógico relacional  
- Implementar o esquema do banco de dados em SQL  
- Popular o banco com dados para testes  
- Desenvolver consultas SQL simples e avançadas  
- Versionar o projeto em um repositório GitHub  

---

## 🧠 Regras de Negócio Implementadas

### 🔹 Cliente PF e PJ
Um cliente pode ser **Pessoa Física (PF)** ou **Pessoa Jurídica (PJ)**, sendo uma **especialização disjunta e total**.  
Um cliente não pode possuir simultaneamente dados de PF e PJ.

### 🔹 Pagamento
Um pedido pode possuir **mais de uma forma de pagamento**, permitindo pagamentos combinados (ex.: cartão + PIX).

### 🔹 Entrega
Cada pedido possui uma entrega associada, contendo:
- Status da entrega  
- Código de rastreio  

### 🔹 Relacionamentos N:N
Relacionamentos muitos-para-muitos foram resolvidos por meio de **tabelas associativas**, conforme o modelo relacional.

---

## 🗂️ Estrutura do Repositório

```text
📁 ecommerce-der
├── README.md
├── docs
│   ├── der
│   │   ├── ecommerce-der.png
│   │   ├── ecommerce-der.pdf
│   │   └── E-commerce.mwb
│   └── modelo-logico
│       ├── schema.sql
│       ├── seed.sql
│       └── queries.sql
 
```
---

## 🧱 Modelo Lógico

O modelo lógico foi derivado diretamente do modelo conceitual EER, respeitando:

- Chaves primárias e estrangeiras  
- Integridade referencial  
- Constraints de unicidade  
- Normalização até a **Terceira Forma Normal (3FN)**  
- Especialização com herança (**Cliente → PF / PJ**)  

O script de criação do banco encontra-se em:
```text
docs/modelo-logico/schema.sql
``` 

---

## 💾 Persistência de Dados

Foram inseridos **no mínimo 10 registros por tabela**, garantindo consistência entre as chaves e possibilitando testes realistas das consultas SQL.

Arquivo:
```text
docs/modelo-logico/seed.sql
```

---

## 🔎 Consultas SQL

Foram desenvolvidas consultas SQL que utilizam:

- `SELECT` (recuperações simples)  
- `WHERE` (filtros)  
- Atributos derivados com expressões SQL  
- `ORDER BY`  
- `GROUP BY` e `HAVING`  
- `JOIN` entre múltiplas tabelas  
- Funções de agregação (`SUM`, `AVG`, `COUNT`)  
- Compatibilidade com `ONLY_FULL_GROUP_BY`  

Arquivo:
```text
docs/modelo-logico/queries.sql
```

### Exemplos de perguntas respondidas

- Quantos pedidos cada cliente realizou?  
- Qual o valor médio pago por cada pedido?  
- Qual o valor total de cada pedido?  
- Quais produtos estão associados a quais fornecedores e estoques?  
- Quais clientes gastaram mais no e-commerce?  

---

## 🛠️ Tecnologias Utilizadas

- MySQL  
- MySQL Workbench  
- SQL padrão  
- Git e GitHub  

---

## 📚 Observações Acadêmicas

- A especialização PF/PJ é **disjunta e total**  
- O controle da especialização é documentado, considerando limitações do SGBD  
- O projeto segue padrões compatíveis com **DIO, ENADE e avaliação acadêmica**  
- As consultas foram testadas com `sql_mode=ONLY_FULL_GROUP_BY`  

---

## 🚀 Conclusão

Este projeto demonstra a aplicação prática dos conceitos fundamentais de banco de dados relacionais, desde a modelagem conceitual até a implementação lógica e análise de dados por meio de consultas SQL.

---

📌 *Projeto desenvolvido para fins educacionais e composição de portfólio no GitHub.*
