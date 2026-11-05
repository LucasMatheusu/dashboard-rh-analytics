DROP TABLE IF EXISTS eletro_vendas;
DROP TABLE IF EXISTS eletro_controle_pontos;
DROP TABLE IF EXISTS eletro_produtos;
DROP TABLE IF EXISTS eletro_vendedores;

CREATE TABLE eletro_vendedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE eletro_controle_pontos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vendedor_id INT,
    data DATE,
    status VARCHAR(50)
);

CREATE TABLE eletro_produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco REAL
);

CREATE TABLE eletro_vendas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_vendedores INT,
    id_produtos INT,
    quantidade INT,
    preco_unitario REAL,
    data DATE
);

INSERT INTO eletro_vendedores (id, nome) VALUES 
    (1, 'Joao'),
    (2, 'Lucas'),
    (3, 'Fabricio'),
    (4, 'Joana'),
    (5, 'Marcia'),
    (6, 'Carla'),
    (7, 'Noemia'),
    (8, 'Paulo'),
    (9, 'Lanna');

INSERT INTO eletro_controle_pontos (vendedor_id, data, status) VALUES 
    (1, '2026-10-01', 'Trabalhou'),
    (1, '2026-10-02', 'Trabalhou'),
    (1, '2026-10-03', 'Atestado'),
    (2, '2026-10-01', 'Trabalhou'),
    (2, '2026-10-02', 'Folga'),
    (2, '2026-10-03', 'Trabalhou'),
    (3, '2026-10-01', 'Folga'),
    (3, '2026-10-02', 'Folga'),
    (3, '2026-10-03', 'Trabalhou'),
    (4, '2026-10-01', 'Atestado'),
    (4, '2026-10-02', 'Trabalhou'),
    (4, '2026-10-03', 'Trabalhou'),
    (5, '2026-10-01', 'Trabalhou'),
    (5, '2026-10-02', 'Falta'),
    (5, '2026-10-03', 'Trabalhou'),
    (6, '2026-10-01', 'Ferias'),
    (6, '2026-10-02', 'Ferias'),
    (6, '2026-10-03', 'trabalhou'),
    (7, '2026-10-01', 'Atestado'),
    (7, '2026-10-02', 'Trabalhou'),
    (7, '2026-10-03', 'Trabalhou'),
    (8, '2026-10-01', 'Faltou'),
    (8, '2026-10-02', 'Trabalhou'),
    (8, '2026-10-03', 'Trabalhou'),
    (9, '2026-10-01', 'Trabalhou'),
    (9, '2026-10-02', 'Trabalhou'),
    (9, '2026-10-03', 'Trabalhou');

INSERT INTO eletro_produtos (nome, categoria, preco) VALUES 
    ('Smart Tv 50 ', 'Televisores', 2000),
    ('Smart Tv 55', 'Televisores', 2420),
    ('Smart Tv 60', 'Televisores', 3900),
    ('Iphone 18 Pro 250Gb ', 'Smartphones', 7899),
    ('Iphone 18 250Gb','Smartphones', 6999),
    ('Iphone 16 Pro max 500Gb', 'Smartphones', 5999),
    ('Xiaomi 14 Pro 500Gb', 'Smartphones', 4300),
    ('Xiami 15 250Gb', 'Smartphones', 4700),
    ('Geladera Frost Free', 'Refrigeração', 4900),
    ('geladeira Inverse', 'Refrigeração', 5299),
    ('Sofa', 'Retrátil', 3999),
    ('Sofa', 'Reclinável', 4190),
    ('Air Fryer 4L', 'Eletroportáteis', 350.00),
    ('Computador Gamer', 'Informática', 4500.00);

INSERT INTO eletro_vendas (id_vendedores, id_produtos, quantidade, preco_unitario, data) VALUES 
    (1, 1, 2, 2000.00, '2026-10-01'), 
    (2, 4, 2, 7899.00, '2026-10-01'), 
    (3, 9, 2, 4900.00, '2026-10-01'),
    (4, 13, 9, 350.00, '2026-10-01'), 
    (1, 6, 1, 5999.00, '2026-10-02'), 
    (3, 11, 2, 3999.00, '2026-10-02'), 
    (4, 2, 2, 2420.00, '2026-10-02'), 
    (7, 5, 2, 6999.00, '2026-10-02'),
    (9, 14, 1, 4500.00, '2026-10-02'),
    (1, 10, 1, 5299.00, '2026-10-03'), 
    (2, 7, 1, 4300.00, '2026-10-03'), 
    (3, 3, 2, 3900.00, '2026-10-03'), 
    (4, 12, 2, 4190.00, '2026-10-03'), 
    (5, 8, 3, 4700.00, '2026-10-03'), 
    (7, 13, 5, 350.00, '2026-10-03'), 
    (9, 4, 3, 7899.00, '2026-10-03');

SELECT 
    v.id AS id_venda,
    ve.nome AS vendedor,
    p.nome AS produto,
    p.categoria,
    v.quantidade,
    v.preco_unitario,
    (v.quantidade * v.preco_unitario) AS valor_total,
    v.data
FROM eletro_vendas v
JOIN eletro_vendedores ve ON v.id_vendedores = ve.id
JOIN eletro_produtos p ON v.id_produtos = p.id;