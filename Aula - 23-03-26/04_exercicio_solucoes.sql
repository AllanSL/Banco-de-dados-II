USE Exercicio_04;

-- Respostas do Exercício 04

-- 1) Liste os empregados e os departamentos a que cada um pertence.
SELECT e.id AS empregado_id, e.nome AS empregado, d.id AS departamento_id, d.nome AS departamento
FROM empregado e
LEFT JOIN departamento d ON e.id_sup = d.id;

-- 2) Quais os projetos controlados pelo departamento de Informática?
SELECT p.id AS projecto_id, p.nome AS projecto
FROM projecto p
INNER JOIN departamento d ON p.id_dep = d.id
WHERE d.nome = 'Informática';

-- 3) Que empregados trabalham no projeto XPTO e quantas horas trabalham?
SELECT e.id AS empregado_id, e.nome AS empregado, t.horas
FROM trabalha t
INNER JOIN empregado e ON t.id_emp = e.id
INNER JOIN projecto p ON t.id_pro = p.id
WHERE p.nome = 'XPTO';

-- 4) Que empregados trabalham no projeto XPTO e quantas horas trabalham? Ordenado por horas descendentemente.
SELECT e.id AS empregado_id, e.nome AS empregado, t.horas
FROM trabalha t
INNER JOIN empregado e ON t.id_emp = e.id
INNER JOIN projecto p ON t.id_pro = p.id
WHERE p.nome = 'XPTO'
ORDER BY t.horas DESC;

-- 5) Quantos empregados trabalham em cada projeto?
SELECT p.id AS projecto_id, p.nome AS projecto, COUNT(t.id_emp) AS quantidade_empregados
FROM projecto p
LEFT JOIN trabalha t ON p.id = t.id_pro
GROUP BY p.id, p.nome;

-- 6) Quantas horas são gastas semanalmente em cada projeto?
SELECT p.id AS projecto_id, p.nome AS projecto, COALESCE(SUM(t.horas),0) AS total_horas_semanais
FROM projecto p
LEFT JOIN trabalha t ON p.id = t.id_pro
GROUP BY p.id, p.nome;

-- 7) Quantas horas cada empregado gasta em projetos?
SELECT e.id AS empregado_id, e.nome AS empregado, COALESCE(SUM(t.horas),0) AS horas_total
FROM empregado e
LEFT JOIN trabalha t ON e.id = t.id_emp
GROUP BY e.id, e.nome;

-- 8) Qual o salário máximo em cada departamento?
SELECT d.id AS departamento_id, d.nome AS departamento, MAX(e.salario) AS salario_maximo
FROM departamento d
LEFT JOIN empregado e ON e.id_sup = d.id
GROUP BY d.id, d.nome;

-- 9) Qual a diferença entre o salário mais alto e o mais baixo da empresa?
SELECT (MAX(salario) - MIN(salario)) AS diferenca_max_min
FROM empregado;

-- 10) Quais os departamentos em que o salário médio é superior a 1300?
SELECT d.id AS departamento_id, d.nome AS departamento, AVG(e.salario) AS salario_medio
FROM departamento d
LEFT JOIN empregado e ON e.id_sup = d.id
GROUP BY d.id, d.nome
HAVING AVG(e.salario) > 1300;

-- 11) Liste todos os empregados e seus respectivos projetos, mesmo que não tenham um projeto associado
SELECT e.id AS empregado_id, e.nome AS empregado, p.id AS projecto_id, p.nome AS projecto
FROM empregado e
LEFT JOIN trabalha t ON e.id = t.id_emp
LEFT JOIN projecto p ON t.id_pro = p.id
ORDER BY e.id;

-- 12) Liste todos os departamentos e seus empregados, incluindo departamentos sem empregados
SELECT d.id AS departamento_id, d.nome AS departamento, e.id AS empregado_id, e.nome AS empregado
FROM departamento d
LEFT JOIN empregado e ON e.id_sup = d.id
ORDER BY d.id;

-- 13) Liste todos os projetos e os empregados que trabalham neles, mesmo que alguns projetos não tenham empregados
SELECT p.id AS projecto_id, p.nome AS projecto, e.id AS empregado_id, e.nome AS empregado
FROM projecto p
LEFT JOIN trabalha t ON p.id = t.id_pro
LEFT JOIN empregado e ON t.id_emp = e.id
ORDER BY p.id;

-- 14) Liste os empregados que não estão alocados em nenhum projeto
SELECT e.id AS empregado_id, e.nome AS empregado
FROM empregado e
LEFT JOIN trabalha t ON e.id = t.id_emp
WHERE t.id_emp IS NULL;

-- 15) Liste os projetos que não possuem nenhum empregado alocado
SELECT p.id AS projecto_id, p.nome AS projecto
FROM projecto p
LEFT JOIN trabalha t ON p.id = t.id_pro
WHERE t.id_emp IS NULL;
