-- Criação do banco de dados
CREATE DATABASE Exercicio_04;
USE Exercicio_04;

-- Tabela de Departamentos
CREATE TABLE departamento (
  id INTEGER PRIMARY KEY, -- Identificador único do departamento
  nome VARCHAR(50) NOT NULL UNIQUE -- Nome do departamento (único)
);

-- Tabela de Empregados
CREATE TABLE empregado (
  id INTEGER PRIMARY KEY, -- Identificador único do empregado
  nome VARCHAR(50) NOT NULL, -- Nome do empregado
  salario DECIMAL(8,2), -- Salário do empregado
  id_sup INTEGER, -- Identificador do departamento ao qual o empregado pertence
  FOREIGN KEY (id_sup) REFERENCES departamento(id) -- Chave estrangeira ligando o empregado ao seu departamento
);

-- Tabela de Projetos
CREATE TABLE projecto (
  id INTEGER PRIMARY KEY, -- Identificador único do projeto
  nome VARCHAR(50) NOT NULL UNIQUE, -- Nome do projeto (único)
  id_dep INTEGER, -- Identificador do departamento responsável pelo projeto
  FOREIGN KEY (id_dep) REFERENCES departamento(id) -- Chave estrangeira ligando o projeto ao seu departamento
);

-- Tabela de Trabalhos (Relacionamento entre empregados e projetos)
CREATE TABLE trabalha (
  id_emp INTEGER, -- Identificador do empregado que trabalha no projeto
  id_pro INTEGER, -- Identificador do projeto no qual o empregado está envolvido
  horas INTEGER NOT NULL, -- Número de horas que o empregado trabalha no projeto por semana
  PRIMARY KEY (id_emp, id_pro), -- Chave primária composta pelos identificadores do empregado e do projeto
  FOREIGN KEY (id_emp) REFERENCES empregado(id), -- Chave estrangeira referenciando a tabela empregado
  FOREIGN KEY (id_pro) REFERENCES projecto(id) -- Chave estrangeira referenciando a tabela projecto
);

-- Tabela Departamento
INSERT INTO departamento VALUES (1, 'Logística');
INSERT INTO departamento VALUES (2, 'Transportes');
INSERT INTO departamento VALUES (3, 'Limpeza');
INSERT INTO departamento VALUES (4, 'Recursos Humanos');
INSERT INTO departamento VALUES (5, 'Informática');
INSERT INTO departamento VALUES (6, 'Financeiro');
INSERT INTO departamento VALUES (7, 'Jurídico');
INSERT INTO departamento VALUES (8, 'Marketing');
INSERT INTO departamento VALUES (9, 'Compras');
INSERT INTO departamento VALUES (10, 'Vendas');
INSERT INTO departamento VALUES (11, 'Administrativo ');
INSERT INTO departamento VALUES (12, 'Pesquisa');
INSERT INTO departamento VALUES (13, 'Desenvolvimento');
INSERT INTO departamento VALUES (14, 'Produção');
INSERT INTO departamento VALUES (15, 'Suporte Técnico');
INSERT INTO departamento VALUES (16, 'Treinamento');
INSERT INTO departamento VALUES (17, 'Segurança');
INSERT INTO departamento VALUES (18, 'Auditoria');
INSERT INTO departamento VALUES (19, 'Relacionamento com Cliente');

-- Tabela Empregado 
INSERT INTO empregado VALUES (1, 'João'      , 1500, 1);
INSERT INTO empregado VALUES (2, 'Miguel'    , 1200, 1);
INSERT INTO empregado VALUES (3, 'João'      , 1300, 1);
INSERT INTO empregado VALUES (4, 'Teresa'    , 1500, 2);
INSERT INTO empregado VALUES (5, 'Carlos'    , 1100, 2);
INSERT INTO empregado VALUES (6, 'Maria'     , 1000, 2);
INSERT INTO empregado VALUES (7, 'Filipa'    ,  800, 2);
INSERT INTO empregado VALUES (8, 'André'     , 1700, 3);
INSERT INTO empregado VALUES (9, 'Tiago'     , 1200, 3);
INSERT INTO empregado VALUES (10, 'Vasco'    , 1300, 3);
INSERT INTO empregado VALUES (11, 'Sérgio'   , 1100, 3);
INSERT INTO empregado VALUES (12, 'Joaquim'  , 1900, 3);
INSERT INTO empregado VALUES (13, 'Diana'    , 1200, 4);
INSERT INTO empregado VALUES (14, 'Manuel'   , 1600, 4);
INSERT INTO empregado VALUES (15, 'Mariana'  , 1200, 5);
INSERT INTO empregado VALUES (16, 'Marco'    , 1400, 5);
INSERT INTO empregado VALUES (17, 'Hélder'   , 1100, 5);
INSERT INTO empregado VALUES (18, 'Francisco', 1000, 5);
INSERT INTO empregado VALUES (19, 'Fátima'   ,  500, 5);
INSERT INTO empregado VALUES (20, 'Joana'    ,  500, 5);
INSERT INTO empregado VALUES (21, 'Adeline'    ,  2000, 6);
INSERT INTO empregado VALUES (22, 'Aglailton'    ,  2800, 6);
INSERT INTO empregado VALUES (23, 'Alddo Gabriel'    ,  2100, 7);
INSERT INTO empregado VALUES (24, 'Aurea'    ,  3000, 7);
INSERT INTO empregado VALUES (25, 'Carlos Eduardo'    ,  500, 8);
INSERT INTO empregado VALUES (26, 'Darllan'    ,  4500, 5);
INSERT INTO empregado VALUES (27, 'Davi'    ,  5100, 5);
INSERT INTO empregado VALUES (28, 'Gabriel Lacerda'    ,  6100, 8);
INSERT INTO empregado VALUES (29, 'Guilherme'    ,  8000, 9);
INSERT INTO empregado VALUES (30, 'João Lucas'    ,  790, 10);
INSERT INTO empregado VALUES (31, 'Karoliny'    ,  1560, 11);
INSERT INTO empregado VALUES (32, 'Leidiane'    ,  6789, 10);
INSERT INTO empregado VALUES (33, 'Livia'    ,  9871, 10);
INSERT INTO empregado VALUES (34, 'Maria Luiza'    ,  3567, 11);
INSERT INTO empregado VALUES (35, 'Michel Plathiny'    ,  8992, 7);
INSERT INTO empregado VALUES (36, 'Juliana', 2600, 18);
INSERT INTO empregado VALUES (37, 'Tatiane', 2500, 19);

-- Tabela Projecto 
INSERT INTO projecto VALUES (1, 'XPTO', 1);
INSERT INTO projecto VALUES (2, 'YPTO', 2);
INSERT INTO projecto VALUES (3, 'ZPTO', 5);
INSERT INTO projecto VALUES (4, 'VVZZ', 10);
INSERT INTO projecto VALUES (5, 'SSPP', 8);
INSERT INTO projecto VALUES (6, 'LLMM', 7);
INSERT INTO projecto VALUES (7, 'PSDE', 7);
INSERT INTO projecto VALUES (8, 'SVFR', 9);
INSERT INTO projecto VALUES (9, 'WXZA', 5);
INSERT INTO projecto VALUES (10, 'PROJ_A', 12);
INSERT INTO projecto VALUES (11, 'PROJ_B', 13);
INSERT INTO projecto VALUES (12, 'PROJ_C', 14);
INSERT INTO projecto VALUES (13, 'PROJ_D', 15);
INSERT INTO projecto VALUES (14, 'PROJ_E', 16);
INSERT INTO projecto VALUES (15, 'PROJ_F', 17);
INSERT INTO projecto VALUES (16, 'PROJ_G', 18);
INSERT INTO projecto VALUES (17, 'PROJ_H', 19);


-- Tabela Trabalha
INSERT INTO trabalha VALUES (1, 1, 4);  -- Empregado 1 trabalha 4 horas no projeto 1
INSERT INTO trabalha VALUES (2, 1, 3);  -- Empregado 2 trabalha 3 horas no projeto 1
INSERT INTO trabalha VALUES (5, 1, 4);  -- Empregado 5 trabalha 4 horas no projeto 1
INSERT INTO trabalha VALUES (7, 1, 2);  -- Empregado 7 trabalha 2 horas no projeto 1
INSERT INTO trabalha VALUES (10, 1, 1); -- Empregado 10 trabalha 1 hora no projeto 1
INSERT INTO trabalha VALUES (11, 1, 7); -- Empregado 11 trabalha 7 horas no projeto 1
INSERT INTO trabalha VALUES (13, 1, 3); -- Empregado 13 trabalha 3 horas no projeto 1
INSERT INTO trabalha VALUES (14, 1, 3); -- Empregado 14 trabalha 3 horas no projeto 1
INSERT INTO trabalha VALUES (20, 1, 6); -- Empregado 20 trabalha 6 horas no projeto 1
INSERT INTO trabalha VALUES (1, 2, 8);  -- Empregado 1 trabalha 8 horas no projeto 2
INSERT INTO trabalha VALUES (2, 2, 7);  -- Empregado 2 trabalha 7 horas no projeto 2
INSERT INTO trabalha VALUES (3, 2, 7);  -- Empregado 3 trabalha 7 horas no projeto 2
INSERT INTO trabalha VALUES (4, 2, 2);  -- Empregado 4 trabalha 2 horas no projeto 2
INSERT INTO trabalha VALUES (6, 2, 3);  -- Empregado 6 trabalha 3 horas no projeto 2
INSERT INTO trabalha VALUES (11, 2, 2); -- Empregado 11 trabalha 2 horas no projeto 2
INSERT INTO trabalha VALUES (12, 2, 1); -- Empregado 12 trabalha 1 hora no projeto 2
INSERT INTO trabalha VALUES (14, 2, 3); -- Empregado 14 trabalha 3 horas no projeto 2
INSERT INTO trabalha VALUES (15, 2, 5); -- Empregado 15 trabalha 5 horas no projeto 2
INSERT INTO trabalha VALUES (17, 2, 4); -- Empregado 17 trabalha 4 horas no projeto 2
INSERT INTO trabalha VALUES (5, 3, 6);  -- Empregado 5 trabalha 6 horas no projeto 3
INSERT INTO trabalha VALUES (12, 3, 3); -- Empregado 12 trabalha 3 horas no projeto 3
INSERT INTO trabalha VALUES (17, 3, 1); -- Empregado 17 trabalha 1 hora no projeto 3
INSERT INTO trabalha VALUES (18, 3, 2); -- Empregado 18 trabalha 2 horas no projeto 3
INSERT INTO trabalha VALUES (21, 4, 2); -- Empregado 21 trabalha 2 horas no projeto 4
INSERT INTO trabalha VALUES (22, 4, 2); -- Empregado 22 trabalha 2 horas no projeto 4
INSERT INTO trabalha VALUES (23, 5, 5); -- Empregado 23 trabalha 5 horas no projeto 5
INSERT INTO trabalha VALUES (25, 5, 6); -- Empregado 25 trabalha 6 horas no projeto 5
INSERT INTO trabalha VALUES (27, 6, 8); -- Empregado 27 trabalha 8 horas no projeto 6
INSERT INTO trabalha VALUES (28, 8, 11); -- Empregado 28 trabalha 11 horas no projeto 8
INSERT INTO trabalha VALUES (30, 8, 10); -- Empregado 30 trabalha 10 horas no projeto 8
INSERT INTO trabalha VALUES (30, 10, 8); -- Fernanda trabalha 8 horas no projeto PROJ_A
INSERT INTO trabalha VALUES (31, 11, 7); -- Ricardo trabalha 7 horas no projeto PROJ_B
INSERT INTO trabalha VALUES (32, 12, 6); -- Patrícia trabalha 6 horas no projeto PROJ_C
INSERT INTO trabalha VALUES (33, 13, 5); -- Luciana trabalha 5 horas no projeto PROJ_D
INSERT INTO trabalha VALUES (34, 14, 4); -- Renato trabalha 4 horas no projeto PROJ_E
INSERT INTO trabalha VALUES (35, 15, 3); -- Alexandre trabalha 3 horas no projeto PROJ_F
INSERT INTO trabalha VALUES (36, 16, 2); -- Juliana trabalha 2 horas no projeto PROJ_G
INSERT INTO trabalha VALUES (37, 17, 1); -- Tatiane trabalha 1 hora no projeto PROJ_H

--                              Exercício 
-- 1) Liste os empregados e os departamentos a que cada um pertence.


-- 2) Quais os projetos controlados pelo departamento de Informática?


-- 3) Que empregados trabalham no projeto XPTO e quantas horas trabalham?


-- 4) Que empregados trabalham no projeto XPTO e quantas horas trabalham? Ordenado por horas descendentemente.


-- 5) Quantos empregados trabalham em cada projeto?


-- 6) Quantas horas são gastas semanalmente em cada projeto?


-- 7) Quantas horas cada empregado gasta em projetos?


-- 8) Qual o salário máximo em cada departamento?


-- 9) Qual a diferença entre o salário mais alto e o mais baixo da empresa?


-- 10) Quais os departamentos em que o salário médio é superior a 1300?


-- 11) Liste todos os empregados e seus respectivos projetos, mesmo que não tenham um projeto associado


-- 12) Liste todos os departamentos e seus empregados, incluindo departamentos sem empregados


-- 13) Liste todos os projetos e os empregados que trabalham neles, mesmo que alguns projetos não tenham empregados


-- 14) Liste os empregados que não estão alocados em nenhum projeto


-- 15) Liste os projetos que não possuem nenhum empregado alocado


