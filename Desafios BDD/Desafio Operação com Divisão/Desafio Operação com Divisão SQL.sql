create database Loja;
use Loja;

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255)
);

-- Criar a tabela Venda
CREATE TABLE Venda (
    id_venda INT PRIMARY KEY,
    data_hora DATETIME
);

-- Criar a tabela ItemVenda
CREATE TABLE ItemVenda (
    id_item INT PRIMARY KEY,
    id_produto INT,
    id_venda INT,
    quantidade INT,
    valor_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_venda) REFERENCES Venda(id_venda)
);

-- Inserir dados na tabela Produto
INSERT INTO Produto (id_produto, nome) VALUES
(1, 'Teclado'),
(2, 'Mouse'),
(3, 'Monitor');

-- Inserir dados na tabela Venda
INSERT INTO Venda (id_venda, data_hora) VALUES
(1, '2024-07-26 10:00:00'),
(2, '2024-07-27 11:00:00'),
(3, '2024-07-28 12:00:00');

-- Inserir dados na tabela ItemVenda
INSERT INTO ItemVenda (id_item, id_produto, id_venda, quantidade, valor_unitario) VALUES
(1, 1, 1, 2, 10.00),
(2, 2, 1, 1, 15.00),
(3, 1, 2, 1, 10.00),
(4, 3, 2, 3, 20.00),
(5, 1, 3, 1, 10.00),
(6, 2, 3, 2, 15.00);

-- Executar a consulta
SELECT P.id_produto, P.nome
FROM Produto P
JOIN ItemVenda IV ON P.id_produto = IV.id_produto
JOIN Venda V ON IV.id_venda = V.id_venda
GROUP BY P.id_produto, P.nome
HAVING COUNT(DISTINCT V.id_venda) = (SELECT COUNT(*) FROM Venda);