Use Standinavia;

CREATE VIEW vwVeiculosDisponiveisAluguer AS
	SELECT V.matricula AS Matricula, V.marca AS Marca, V.modelo AS Modelo, V.combustivel AS Combustivel, V.preco_aluguer AS PreçoAluguer
	FROM Veiculo AS V
	WHERE V.preco_aluguer is NOT NULL AND V.estado = 'Disponivel';



SELECT *FROM vwVeiculosDisponiveisAluguer;
Use Standinavia;

CREATE VIEW vwFaturas AS 
	SELECT F.id_Fatura AS Fatura, F.valorTotal AS Preço, F.garantia AS Garantia, 
    F.data AS Data, Fu.nome AS Funcionario, Cl.nome AS Cliente, F.matricula AS Veiculo, F.tipo AS Tipo, F.id_Aluguer AS Nº_Aluguer
    FROM Fatura AS F, Funcionario AS Fu, Cliente AS Cl
	WHERE Fu.id_Funcionario = F.idFuncionario_emissor
    AND Cl.id_Cliente = F.id_Cliente
    GROUP BY id_Fatura;
    
    
SELECT *FROM vwFaturas;    