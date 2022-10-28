use Standinavia;

-- Listar veiculos.
SELECT * FROM Veiculo; 

-- Listar funcionarios.
SELECT *FROM Funcionario;

-- Listar clientes.
SELECT *FROM Cliente;

-- Listar veiculos a gasolina
SELECT *FROM Veiculo 
WHERE Veiculo.combustivel = 'gasolina';


-- Listar veiculos disponiveis para compra
SELECT V.matricula, V.marca, V.modelo, V.combustivel, V.preco_venda
FROM Veiculo AS V
WHERE V.preco_venda is NOT NULL AND V.estado = 'Disponivel';

-- Listar as moradas dos Clientes
SELECT C.nome, M.cod_postal, M.rua, M.localidade, M.concelho 
FROM Cliente AS C 
		INNER JOIN Morada as M 
		ON C.Morada = M.cod_postal; 

        
-- Listar todas as Faturas emitidas pelo funcionario 2
SELECT F.id_Fatura AS Fatura, F.valorTotal AS Valor, F.garantia, Cl.nome AS Cliente, F.matricula AS Veiculo, F.tipo
FROM Fatura AS F, Cliente as Cl
	WHERE F.idFuncionario_emissor = '2' and F.id_Cliente = Cl.id_Cliente; 


-- Funcionario com mais vendas
SELECT F.nome AS MelhorVendedor
FROM Funcionario AS F
ORDER BY numero_vendas DESC
LIMIT 1;



-- Listar veiculos disponiveis para alugar com preco de venda inferior a 35
SELECT V.matricula, V.marca, V.modelo, V.combustivel, V.preco_aluguer
        FROM Veiculo as V
		WHERE V.preco_aluguer < 35;

-- Listar todas as pessoas 
SELECT C.nome FROM CLIENTE AS C
UNION
SELECT F.nome FROM Funcionario AS F;


-- Listar os emails dos Clientes que pertencem ao gmail
SELECT Cl.nome AS Nome, C.email AS Email 
FROM Contacto AS C
	INNER JOIN Cliente AS Cl
	ON C.telemovel = Cl.contacto
    WHERE C.email like '%@gmail.com';

-- Listar a Localidade,rua dos Clientes que pertencem ao concelho de Fafe
SELECT Cl.nome AS Nome, M.localidade AS Localidade, M.rua AS Rua 
FROM Morada AS M
	INNER JOIN Cliente AS Cl
	ON M.cod_postal = Cl.morada
    where M.concelho = 'Fafe';





   