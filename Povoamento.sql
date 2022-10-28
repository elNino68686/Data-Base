use Standinavia; 

-- Inserção de Veiculos 

insert into Veiculo 
	(matricula, marca,modelo,combustivel,preco_venda, preco_aluguer, estado)
	values
	('12-mn-34', 'BMW', '330','gasoleo', NULL, '50.00', 'Disponivel'),
	('73-zx-78', 'Mercedes','a45', 'gasolina', '100000.00', NULL, 'Disponivel'),
	('92-fg-24', 'Audi','a7', 'gasolina', NULL, '45.50', 'Disponivel'),
	('37-11-xz', 'Ferrari','sf90', 'gasolina', '2000000.00', NULL, 'Disponivel'),
	('45-23-yz', 'Renault','clio', 'gasoleo', NULL, '30.00', 'Não Disponivel'),
	('10-11-pp', 'Toyota','corolla', 'gasoleo', '30000.00', NULL, 'Disponivel'),
	('42-po-84', 'BMW','M4', 'gasolina', '50000.00', NULL, 'Disponivel'),
	('27-wn-35', 'Audi','Q7' ,'gasoleo', NULL, '40.00', 'Não Disponivel'),
	('31-yn-11', 'Porshe','panamera' ,'gasolina', '250000.00', NULL,'Disponivel'),
	('ch-22-33', 'Mercedes','EQ' ,'eletrico', '500000.00', NULL,'Disponivel'),
	('lk-44-55', 'BMW','118' ,'gasoleo', NULL, '55.00', 'Disponivel'),
	('ff-33-88', 'Renault','megane' ,'gasolina', NULL, '35.00', 'Disponivel'),
	('jk-21-32', 'Ford','fiesta' ,'gasoleo', NULL, '40.00', 'Disponivel'),
	('31-gg-34', 'Ford','mustang' ,'hibrido', '75000.00', NULL,'Disponivel'),
	('20-mn-30', 'Audi','a1' ,'gasoleo', NULL, '32.00', 'Não Disponivel'),
	('21-tn-35', 'Citroen', 'c4','gasolina', NULL, '25.00', 'Disponivel'),
	('90-rn-34', 'BMW','i8' ,'eletrico', '123000.00', NULL, 'Disponivel'),
	('88-nm-54', 'Mercedes', 'c220','gasoleo', NULL, '42.00', 'Não Disponivel'),
	('99-xx-88', 'Ford', 'Mustang', 'gasolina', '500000.00', NULL, 'Não Disponivel');
	
	select *from Veiculo;

-- Inserção de Funcionarios

insert into Funcionario
	(id_Funcionario,nome, numero_vendas)
	values
	('1', 'Jose Tolo', '1'),
	('2', 'Bardon Daniel', '2'),
	('3', 'John niño', '0'),
	('4', 'Bruna Freira', '1'),
	('5', 'Luis Mendes', '1');


select *from Funcionario;


-- Inserção de Moradas

insert into Morada
	(cod_postal, rua, localidade, concelho)
	values
	('4820-781', 'Rua da Castanheira', 'Travassos', 'Fafe'),
	('4820-123', 'Avenida do Brasil', 'Fafe', 'Fafe'),
	('4820-888', 'Rua da cumieira', 'Fafe', 'Fafe'),
	('4710-456', 'Rua dos peoes', 'Braga', 'Braga'),
	('4710-710', 'Rua de santa cruz', 'Braga', 'Braga'),
	('4250-298', 'Rua de Monte Alegre', 'Porto', 'Porto'),
	('4400-000', 'Travessa da cova', 'Gaia', 'Porto');

select *from Morada;

-- Inserção de Contactos

insert into Contacto
	(telemovel, email)
	values
	('912345678', 'albinacostinha@gmail.com'),
	('777777777', NULL),
	('123123123', 'davidezinho@hotmail.com'),
	('121212121', 'setemaravilhas@gmail.com'),
	('991991991', NULL),
	('111222333', 'felgas@gmail.com'),
	('777999888', 'truquesmagia@gmail.com');

select *from Contacto;


-- Inserção de Clientes

insert into Cliente
	(id_Cliente, nome, morada, contacto, data_nascimento)
	values
	('1', 'Albino Costa', '4710-710', '912345678', '1988-1-28'),
	('2', 'Cristiano Ronaldo','4820-781', '777777777', '2001-2-27'),
	('3', 'Inacio Enes', '4820-888', '123123123', '1998-3-25'),
	('4', 'Sonia Barreiros', '4710-456', '121212121', '2003-12-12'),
	('5', 'Antonio Alfredo', '4820-123', '991991991', '1998-6-22'),
	('6', 'Tone Felgueiras', '4400-000', '111222333', '1995-8-2'),
	('7', 'Xico Truques', '4250-298', '777999888', '2000-3-23');


select *from Cliente;




-- Inserção de Seguros

insert into Seguro
	(tipo, preco)
	values
	('Standart', '5.00'),
	('Premium', '10.00'); 

select *from Seguro;



-- Inserção de Aluguer

insert into Aluguer
	(id_Aluguer, seguro, duracao, matricula, id_Cliente, data_inicial)
	values
	('1', 'Standart', '30', '88-nm-54', '1', '2021-5-12'),
	('2', 'Premium', '50', '27-wn-35', '2', '2021-5-13'),
	('3', 'Premium', '25', '45-23-yz', '1', '2021-5-14'),
	('4', 'Standart', '15', '20-mn-30', '4', '2021-5-15');
	
select *from Aluguer;

-- Inserção de Fatura

insert into Fatura
	(id_Fatura, valorTotal, garantia, data, idFuncionario_emissor, id_Cliente, matricula, tipo, id_Aluguer)
	values
	('0', '1260.00', NULL, '2021-6-12', '1', '1', '88-nm-54', 'Aluguer', '1'),
	('1', '2000.00', NULL, '2021-7-3', '2', '2', '27-wn-35', 'Aluguer', '2'),
	('2', '1260.00', NULL, '2021-6-9', '5', '1', '45-23-yz','Aluguer', '3'),
	('3', '500000.00', '2', '2021-4-15', '4', '3', '99-xx-88', 'Compra', NULL),
	('4', '480.00', NULL, '2021-6-1', '2', '4', '20-mn-30', 'Aluguer', '4');
	

select *from Fatura;

