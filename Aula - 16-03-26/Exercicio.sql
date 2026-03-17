CREATE DATABASE TechStore;
USE TechStore;

-- Tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20),
    Cidade VARCHAR(50)
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Preco DECIMAL(10,2),
    CategoriaID INT,
    Estoque INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Tabela de Categorias
CREATE TABLE Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCategoria VARCHAR(100)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    Total DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabela de Pagamentos
CREATE TABLE Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    MetodoPagamento VARCHAR(50),
    StatusPagamento VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

-- Clientes
INSERT INTO Clientes (Nome, Email, Telefone, Cidade) VALUES
('Ana Souza', 'ana@email.com', '11999999999', 'São Paulo'),
('Carlos Mendes', 'carlos@email.com', '11988888888', 'Rio de Janeiro'),
('Bruna Lima', 'bruna@email.com', '11977777777', 'Belo Horizonte'),
('Diego Alves', 'diego@email.com', '11966666666', 'Curitiba'),
('Fernanda Rocha', 'fernanda@email.com', '11955555555', 'Brasília'),
('Gustavo Martins', 'gustavo@email.com', '11944444444', 'Porto Alegre'),
('Helena Farias', 'helena@email.com', '11933333333', 'Recife'),
('Igor Santos', 'igor@email.com', '11922222222', 'Salvador'),
('Juliana Campos', 'juliana@email.com', '11911111111', 'Fortaleza'),
('Lucas Nogueira', 'lucas@email.com', '11900000000', 'Manaus');

-- Categorias
INSERT INTO Categorias (NomeCategoria) VALUES
('Celulares'),
('Notebooks'),
('Tablets'),
('Acessórios'),
('Smartwatches'),
('Consoles'),
('Câmeras'),
('Monitores'),
('Fones de ouvido'),
('TVs');

-- Produtos
INSERT INTO Produtos (NomeProduto, Preco, CategoriaID, Estoque) VALUES
('iPhone 14', 6999.99, 1, 20),
('Samsung Galaxy S22', 5499.99, 1, 15),
('Notebook Dell XPS', 8999.99, 2, 10),
('MacBook Air M1', 7999.99, 2, 12),
('iPad Pro', 5999.99, 3, 18),
('Smartwatch Apple', 3499.99, 5, 25),
('Fone JBL', 299.99, 9, 30),
('Console PlayStation 5', 4999.99, 6, 5),
('Monitor LG 24”', 1199.99, 8, 8),
('Câmera Canon EOS', 3299.99, 7, 6);

-- Pedidos
INSERT INTO Pedidos (ClienteID, DataPedido, Total) VALUES
(1, '2024-01-15', 6999.99),
(2, '2024-02-18', 5499.99),
(3, '2024-03-21', 8999.99),
(4, '2024-04-10', 7999.99),
(5, '2024-05-05', 5999.99),
(6, '2024-06-07', 3499.99),
(7, '2024-07-09', 299.99),
(8, '2024-08-13', 4999.99),
(9, '2024-09-20', 1199.99),
(10, '2024-10-25', 3299.99);

-- Pagamentos
INSERT INTO Pagamentos (PedidoID, MetodoPagamento, StatusPagamento) VALUES
(1, 'Cartão de Crédito', 'Pago'),
(2, 'Boleto', 'Pendente'),
(3, 'PIX', 'Pago'),
(4, 'Cartão de Crédito', 'Pago'),
(5, 'Boleto', 'Cancelado'),
(6, 'PIX', 'Pago'),
(7, 'Cartão de Débito', 'Pago'),
(8, 'Cartão de Crédito', 'Pendente'),
(9, 'Boleto', 'Pago'),
(10, 'PIX', 'Pago');

--  Questões Utilizando INNER JOIN 

-- 1. Listar o nome do cliente e os pedidos realizados.
SELECT c.Nome AS cliente, p.PedidoID, p.DataPedido, p.Total
FROM Pedidos p
INNER JOIN Clientes c ON p.ClienteID = c.ClienteID;

-- 2. Exibir os produtos comprados com seus preços e categorias.
SELECT pr.NomeProduto, pr.Preco, ca.NomeCategoria
FROM Produtos pr
INNER JOIN Categorias ca ON pr.CategoriaID = ca.CategoriaID;

-- 3. Listar os pedidos com status de pagamento e método de pagamento.
SELECT p.PedidoID, p.DataPedido, p.Total, pay.MetodoPagamento, pay.StatusPagamento
FROM Pedidos p
INNER JOIN Pagamentos pay ON p.PedidoID = pay.PedidoID;

-- 4. Mostrar o nome do cliente e o status do pagamento dos seus pedidos.
SELECT c.Nome AS cliente, p.PedidoID, pay.StatusPagamento
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN Pagamentos pay ON p.PedidoID = pay.PedidoID;

-- 5. Quais clientes compraram um "iPhone 14"?
SELECT c.Nome AS cliente, pr.NomeProduto
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN Produtos pr ON p.PedidoID = pr.ProdutoID
WHERE pr.NomeProduto = 'iPhone 14';

 -- 6. Mostrar os pedidos feitos por clientes de São Paulo.
SELECT c.Nome AS cliente, p.PedidoID, p.DataPedido, p.Total
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
WHERE c.Cidade = 'São Paulo';

-- 7. Listar todos os produtos e suas categorias.
SELECT pr.NomeProduto, ca.NomeCategoria
FROM Produtos pr
INNER JOIN Categorias ca ON pr.CategoriaID = ca.CategoriaID;

-- 8. Mostrar os clientes que fizeram pedidos acima de R$ 5.000,00.
SELECT c.Nome AS cliente, p.PedidoID, p.Total
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
WHERE p.Total > 5000.00;

-- 9. Quais produtos pertencem à categoria "Notebooks"?
SELECT pr.NomeProduto, pr.Preco
FROM Produtos pr
INNER JOIN Categorias ca ON pr.CategoriaID = ca.CategoriaID
WHERE ca.NomeCategoria = 'Notebooks';

-- 10. Listar clientes que pagaram com PIX.
SELECT c.Nome AS cliente
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN Pagamentos pay ON p.PedidoID = pay.PedidoID
WHERE pay.MetodoPagamento = 'PIX';

-- 11. Listar todos os pedidos pagos.
SELECT p.PedidoID, p.DataPedido, p.Total, c.Nome AS cliente
FROM Pedidos p
INNER JOIN Pagamentos pay ON p.PedidoID = pay.PedidoID
INNER JOIN Clientes c ON p.ClienteID = c.ClienteID
WHERE pay.StatusPagamento = 'Pago';

-- 12. Listar os clientes e os produtos que compraram.
SELECT c.Nome AS cliente, pr.NomeProduto
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN Produtos pr ON p.PedidoID = pr.ProdutoID;