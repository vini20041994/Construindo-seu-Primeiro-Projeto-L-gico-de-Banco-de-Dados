-- INSERTS – POPULAÇÃO DO BANCO DE DADOS 

-- CLIENTE

INSERT INTO Cliente (idCliente, nome, endereco, email) VALUES
(1,'João Silva','Rua A','joao@email.com'),
(2,'Maria Souza','Rua B','maria@email.com'),
(3,'Carlos Lima','Rua C','carlos@email.com'),
(4,'Ana Paula','Rua D','ana@email.com'),
(5,'Bruno Rocha','Rua E','bruno@email.com'),
(6,'XPTO LTDA','Av Central','contato@xpto.com'),
(7,'Tech Brasil','Av Paulista','tech@br.com'),
(8,'Loja Digital','Rua Online','digital@loja.com'),
(9,'Mega Store','Av Norte','mega@store.com'),
(10,'Comercial Alpha','Rua Sul','alpha@comercial.com');

-- CLIENTE_PF

INSERT INTO Cliente_PF (idCliente, cpf) VALUES
(1,'11111111111'),
(2,'22222222222'),
(3,'33333333333'),
(4,'44444444444'),
(5,'55555555555');

-- CLIENTE_PJ

INSERT INTO Cliente_PJ (idCliente, cnpj, razao_social) VALUES
(6,'11111111000111','XPTO LTDA'),
(7,'22222222000122','Tech Brasil'),
(8,'33333333000133','Loja Digital'),
(9,'44444444000144','Mega Store'),
(10,'55555555000155','Comercial Alpha');

-- PEDIDO

INSERT INTO Pedido (idPedido, data_pedido, status, Cliente_idCliente, frete) VALUES
(1,'2024-01-01','Finalizado',1,20),
(2,'2024-01-02','Finalizado',2,25),
(3,'2024-01-03','Em andamento',3,15),
(4,'2024-01-04','Em andamento',4,18),
(5,'2024-01-05','Cancelado',5,10),
(6,'2024-01-06','Finalizado',6,30),
(7,'2024-01-07','Finalizado',7,22),
(8,'2024-01-08','Em andamento',8,28),
(9,'2024-01-09','Finalizado',9,35),
(10,'2024-01-10','Finalizado',10,40);

-- PAGAMENTO

INSERT INTO Pagamento (idPagamento, tipo_pagamento, valor, Pedido_idPedido) VALUES
(1,'Cartão',200,1),
(2,'Pix',100,1),
(3,'Boleto',250,2),
(4,'Cartão',300,3),
(5,'Pix',150,4),
(6,'Cartão',400,6),
(7,'Pix',200,6),
(8,'Boleto',500,7),
(9,'Cartão',350,9),
(10,'Pix',150,10);

-- ENTREGA

INSERT INTO Entrega (idEntrega, status_entrega, codigo_rastreio, Pedido_idPedido) VALUES
(1,'Entregue','BR0001',1),
(2,'Entregue','BR0002',2),
(3,'Em trânsito','BR0003',3),
(4,'Separação','BR0004',4),
(5,'Cancelada','BR0005',5),
(6,'Entregue','BR0006',6),
(7,'Entregue','BR0007',7),
(8,'Em trânsito','BR0008',8),
(9,'Entregue','BR0009',9),
(10,'Entregue','BR0010',10);

-- PRODUTO

INSERT INTO Produto (idProduto, nome, categoria, valor) VALUES
(1,'Notebook','Eletrônicos',3500),
(2,'Mouse','Periféricos',150),
(3,'Teclado','Periféricos',200),
(4,'Monitor','Eletrônicos',1200),
(5,'Impressora','Eletrônicos',900),
(6,'Headset','Áudio',300),
(7,'Webcam','Acessórios',250),
(8,'HD Externo','Armazenamento',600),
(9,'SSD','Armazenamento',800),
(10,'Cadeira Gamer','Móveis',1500);

-- FORNECEDOR

INSERT INTO Fornecedor (idFornecedor, razao_social, cnpj) VALUES
(1,'Tech Brasil','10101010000101'),
(2,'Info Plus','20202020000102'),
(3,'Mega Eletrônicos','30303030000103'),
(4,'Digital World','40404040000104'),
(5,'Fast Tech','50505050000105'),
(6,'Power Hardware','60606060000106'),
(7,'Alpha Imports','70707070000107'),
(8,'Global Parts','80808080000108'),
(9,'Next Gen','90909090000109'),
(10,'Data Store','11111111000110');

-- ESTOQUE

INSERT INTO Estoque (idEstoque, local) VALUES
(1,'São Paulo'),
(2,'Rio de Janeiro'),
(3,'Minas Gerais'),
(4,'Paraná'),
(5,'Santa Catarina'),
(6,'Bahia'),
(7,'Pernambuco'),
(8,'Ceará'),
(9,'Goiás'),
(10,'Amazonas');

-- PRODUTO_ESTOQUE

INSERT INTO Produto_Estoque VALUES
(1,1,10),
(2,2,50),
(3,3,30),
(4,4,15),
(5,5,20),
(6,6,40),
(7,7,25),
(8,8,18),
(9,9,22),
(10,10,12);

-- FORNECEDOR_PRODUTO

INSERT INTO Fornecedor_Produto VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

-- PRODUTO_PEDIDO

INSERT INTO Produto_Pedido VALUES
(1,1,1),
(2,1,2),
(3,2,1),
(4,3,1),
(5,4,2),
(6,6,1),
(7,7,3),
(8,8,1),
(9,9,2),
(10,10,1);
