# Aula — 23/03/2026

## Tema: Joins, Agregação e Subqueries em SQL

---

### 📌 Objetivos
- Entender e aplicar os tipos de JOIN (INNER, LEFT, RIGHT, FULL simulado, CROSS, SELF).
- Usar funções de agregação (COUNT, SUM, AVG, MAX, MIN) com GROUP BY e HAVING.
- Construir e validar consultas que relacionam múltiplas tabelas (incluindo tabelas associativas).
- Filtrar resultados com WHERE e combinar com agregações quando necessário.
- Interpretar resultados e verificar integridade dos dados com consultas de teste.

---

### 📂 Scripts da Aula

| Arquivo | Descrição |
|---|---|
| [`Exercício_04.sql`](Exerc%C3%ADcio_04.sql) | DDL e inserts do exercício (cria o banco `Exercicio_04` e popula os dados) |
| [`04_exercicio_solucoes.sql`](04_exercicio_solucoes.sql) | Soluções do exercício proposto (15 queries) |
| [`instrucoes.txt`](instrucoes.txt) | Instruções para realização do exercício |
| [`diagrama.png`](diagrama.png) | Diagrama ilustrativo do modelo (se aplicável) |

---

### ▶️ Como executar
1. Execute o script `Exercício_04.sql` para criar o schema e popular os dados:
   mysql -u root -p < Exercício_04.sql
2. Abra o banco `Exercicio_04` e rode as consultas em `01_queries.sql` e depois as soluções em `04_exercicio_solucoes.sql` para validar os resultados.
3. Teste cada query individualmente e verifique os resultados esperados descritos nos comentários dos scripts.

---

### 📝 Observações
- O exercício enfatiza a construção correta de JOINs e o uso de agregação com GROUP BY/HAVING.
- Para operações que dependem de tabelas associativas (ex.: relacionar pedidos a produtos), certifique-se de que as tabelas de ligação existem (ex: `ItensPedido`, `trabalha`).
- Evite armazenar senhas em arquivos do projeto; use variáveis de ambiente ou `~/.my.cnf` com permissão restrita.
