CREATE DATABASE ecommerce;
USE ecommerce;

-- CLIENTE
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    email VARCHAR(100)
);

-- CLIENTE PF
CREATE TABLE Cliente_PF (
    idCliente INT PRIMARY KEY,
    cpf CHAR(11) UNIQUE NOT NULL,
    CONSTRAINT fk_pf_cliente
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- CLIENTE PJ
CREATE TABLE Cliente_PJ (
    idCliente INT PRIMARY KEY,
    cnpj CHAR(14) UNIQUE NOT NULL,
    razao_social VARCHAR(100),
    CONSTRAINT fk_pj_cliente
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- PEDIDO
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE,
    status VARCHAR(30),
    Cliente_idCliente INT,
    frete DECIMAL(10,2),
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- PAGAMENTO
CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento VARCHAR(30),
    valor DECIMAL(10,2),
    Pedido_idPedido INT,
    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- ENTREGA
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    status_entrega VARCHAR(30),
    codigo_rastreio VARCHAR(50) UNIQUE,
    Pedido_idPedido INT UNIQUE,
    CONSTRAINT fk_entrega_pedido
        FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- PRODUTO
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    valor DECIMAL(10,2)
);

-- FORNECEDOR
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100),
    cnpj CHAR(14) UNIQUE
);

-- ESTOQUE
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    local VARCHAR(100)
);

-- PRODUTO x PEDIDO
CREATE TABLE Produto_Pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    quantidade INT,
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- PRODUTO x ESTOQUE
CREATE TABLE Produto_Estoque (
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    quantidade INT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- FORNECEDOR x PRODUTO
CREATE TABLE Fornecedor_Produto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);
