-- Tabela Cliente
CREATE TABLE Cliente (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL
);

-- Tabela Filial
CREATE TABLE Filial (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    ID INT PRIMARY KEY,
    Modelo VARCHAR(255) NOT NULL,
    Marca VARCHAR(255) NOT NULL,
    Ano INT NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Disponivel BOOLEAN NOT NULL,
    PrecoPorDia DECIMAL(10, 2) NOT NULL,
    Filial_ID INT,
    FOREIGN KEY (Filial_ID) REFERENCES Filial(ID)
);

-- Tabela Aluguel
CREATE TABLE Aluguel (
    ID INT PRIMARY KEY,
    DataInicio DATE NOT NULL,
    DataTermino DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    StatusPagto VARCHAR(50) NOT NULL,
    Cliente_ID INT,
    Veiculo_ID INT,
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID),
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(ID)
);

INSERT INTO Cliente (ID, Nome, Endereco, Email, Telefone)
VALUES (1, 'João Silva', 'Rua A, 123', 'joao@email.com', '(123) 456-7890');

INSERT INTO Filial (ID, Nome, Endereco)
VALUES (1, 'Filial Central', 'Avenida B, 456');

INSERT INTO Veiculo (ID, Modelo, Marca, Ano, Tipo, Disponivel, PrecoPorDia, Filial_ID)
VALUES (1, 'Sedan', 'Toyota', 2022, 'Carro', TRUE, 100.00, 1);

INSERT INTO Aluguel (ID, DataInicio, DataTermino, ValorTotal, StatusPagto, Cliente_ID, Veiculo_ID)
VALUES (1, '2023-08-01', '2023-08-10', 1000.00, 'Pago', 1, 1);

SELECT * FROM Cliente;

SELECT Veiculo.ID, Veiculo.Modelo, Veiculo.Marca, Veiculo.Ano, Veiculo.PrecoPorDia
FROM Veiculo
WHERE Veiculo.Filial_ID = 1;
