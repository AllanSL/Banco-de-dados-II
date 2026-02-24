CREATE DATABASE IF NOT EXISTS AulaBDII;
USE AulaBDII;

-- Tabela de autores
CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nacionalidade VARCHAR(100)
);

-- Tabela de livros
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    editora VARCHAR(150),
    ano_publicacao YEAR
);

-- Tabela de usuarios (alunos e professores)
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    tipo ENUM('aluno', 'professor') NOT NULL
);

-- Tabela de emprestimos (1:N com usuario e livro)
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status ENUM('ativo', 'devolvido', 'atrasado') NOT NULL DEFAULT 'ativo',
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

-- Tabela associativa livro_autor (N:M entre livro e autor)
CREATE TABLE livro_autor (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

