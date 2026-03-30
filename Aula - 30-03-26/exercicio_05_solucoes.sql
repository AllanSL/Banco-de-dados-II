# Allan Batista do Nascimento

USE Exercicio_05;

/* 3 – Faça as consultas usando SQL */
/* Consultas usando JOIN e funções de agregação */

-- 1- Listar todas as disciplinas oferecidas em 2018 com os respectivos professores responsáveis e a cidade de atuação.
SELECT d.disc_nome, p.prof_nome, p.prof_cidade
FROM disciplina d
INNER JOIN professor_disciplina pd ON d.disc_codigo = pd.disc_codigo
INNER JOIN professor p ON pd.prof_numero = p.prof_numero
WHERE pd.ano = '2018';

-- 2- Listar os professores que ministram disciplinas no curso "CST Sistemas para Internet" no ano de 2018.
SELECT p.prof_nome, d.disc_nome
FROM professor p
INNER JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero
INNER JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
WHERE d.curso_nome = 'CST Sistemas para Internet' AND pd.ano = '2018';

-- 3- Listar os alunos matriculados em 2018, junto com suas disciplinas, cidade e curso correspondente.
SELECT a.aluno_nome, d.disc_nome, a.aluno_cidade, d.curso_nome
FROM aluno a
INNER JOIN matricula m ON a.aluno_numero = m.aluno_numero
INNER JOIN disciplina d ON m.disc_codigo = d.disc_codigo
WHERE m.ano = '2018';

-- 4- Listar os alunos de Palmas que estão matriculados na disciplina "Programação de Banco de dados" no ano de 2018.
SELECT a.aluno_nome
FROM aluno a
INNER JOIN matricula m ON a.aluno_numero = m.aluno_numero
INNER JOIN disciplina d ON m.disc_codigo = d.disc_codigo
WHERE a.aluno_cidade = 'Palmas' AND d.disc_nome = 'Programação de Banco de dados' AND m.ano = '2018';

-- 5- Listar os professores que não residem em Palmas e que ministram disciplinas no curso "CST Sistemas para Internet".
SELECT p.prof_nome, p.prof_cidade
FROM professor p
INNER JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero
INNER JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
WHERE p.prof_cidade <> 'Palmas' AND d.curso_nome = 'CST Sistemas para Internet';

-- 6- Calcular a média de aulas ministradas por professor.
SELECT p.prof_nome, AVG(d.qtd_aulas) AS media_aulas
FROM professor p
INNER JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero
INNER JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
GROUP BY p.prof_nome;

-- 7- Listar o total de aulas ministradas por curso, agrupado por professor.
SELECT p.prof_nome, d.curso_nome, SUM(d.qtd_aulas) AS total_aulas
FROM professor p
INNER JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero
INNER JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
GROUP BY p.prof_nome, d.curso_nome;

-- 8- Listar os alunos matriculados em 2018, incluindo nome, curso e disciplinas.
SELECT a.aluno_nome, d.curso_nome, d.disc_nome
FROM aluno a
INNER JOIN matricula m ON a.aluno_numero = m.aluno_numero
INNER JOIN disciplina d ON m.disc_codigo = d.disc_codigo
WHERE m.ano = '2018';

-- 9- Listar todas as disciplinas, incluindo as que não possuem professores responsáveis.
SELECT d.disc_nome, p.prof_nome
FROM disciplina d
LEFT JOIN professor_disciplina pd ON d.disc_codigo = pd.disc_codigo
LEFT JOIN professor p ON pd.prof_numero = p.prof_numero;

-- 10- Listar todos os alunos e suas respectivas disciplinas, incluindo aqueles sem matrícula.
SELECT a.aluno_nome, d.disc_nome
FROM aluno a
LEFT JOIN matricula m ON a.aluno_numero = m.aluno_numero
LEFT JOIN disciplina d ON m.disc_codigo = d.disc_codigo;

-- 11- Listar todas as disciplinas e professores, incluindo aqueles que não estão lecionando disciplinas.
SELECT p.prof_nome, d.disc_nome
FROM professor p
LEFT JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero
LEFT JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
UNION
SELECT p.prof_nome, d.disc_nome
FROM disciplina d
LEFT JOIN professor_disciplina pd ON d.disc_codigo = pd.disc_codigo
LEFT JOIN professor p ON pd.prof_numero = p.prof_numero;