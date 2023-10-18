use IMOBILIARIO
go

--Aumente o preço de vendas dos imóveis em 12%
update IMOVEL
	set vl_Imovel = vl_Imovel * 1.12
go

--Abaixe o preço de venda dos imóveis do vendedor 1 em 5%
update IMOVEL
	set vl_Imovel *= 0.95
		where cd_Vendedor = 1
go

--Altere o endereço do comprador 3 para R. ANANÁS, 45 e o estado para RJ
update COMPRADOR 
	set ds_Endereco = 'R. ANANÁS, 45', sg_Estado = 'RJ'
		where cd_Comprador = 3
go

--Altere a oferta do comprador 2 no imóvel 4 para 101.000
update OFERTA
	set vl_Oferta = 101000
		where cd_Comprador = 2 AND cd_Imovel = 4
go

--Exclua a oferta do comprador 3 no imóvel 1
DELETE from OFERTA where cd_Comprador=3 AND cd_Imovel = 1
go

--Altere a tabela de forma a incluir as restrições de integridades, usando PK_Imovel para a restrição da chave primária na tabela Imóvel.
Alter Table Imovel
  Drop Constraint PK__Imovel__54ED318D8BE4FCA1
go

Alter Table Imovel
  Add Constraint PK_Imovel Primary Key (cd_Imovel)
go

--Adicionar uma coluna qt_Parcelas do tipo número inteiro na tabela Oferta, já criada e essa coluna deve aceitar números maiores que 1, usando o nome CK_qtParcela para a restrição.
Alter Table Oferta
  Add qt_Parcelas Int Constraint CK_Parcelas Check (qt_Parcelas > 1)

--Destrua a coluna qt_Parcelas da tabela Oferta.
Alter Table Oferta
  Drop Constraint CK_Parcelas
go

Alter Table Oferta
  Drop Column qt_Parcelas
