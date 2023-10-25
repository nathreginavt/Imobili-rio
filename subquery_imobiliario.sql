USE IMOBILIARIO
go

--Fa�a uma lista de im�veis do mesmo bairro do im�vel 2. 
--Exclua o im�vel 2 da sua busca
SELECT cd_Imovel, cd_Bairro, cd_Cidade, sg_Estado
FROM Imovel 
WHERE cd_Bairro = 
	(SELECT cd_Bairro FROM Imovel WHERE cd_Imovel=2)
AND cd_Cidade = 
	(SELECT cd_Cidade FROM Imovel WHERE cd_Imovel=2)
AND sg_Estado = 
	(SELECT sg_Estado FROM Imovel WHERE cd_Imovel = 2)
AND cd_Imovel <> 2

-- Fa�a uma lista que mostre todos os im�veis que custam mais que a m�dia de pre�o dos im�veis.
SELECT cd_Imovel, vl_Imovel
FROM Imovel
WHERE vl_Imovel >
	(SELECT AVG(vl_Imovel) 
	FROM Imovel)

--Fa�a uma lista com todos os im�veis com pre�o superior � m�dia de pre�o dos im�veis do mesmo bairro.
SELECT cd_Bairro, cd_Imovel, vl_Imovel
FROM Imovel AS I
WHERE vl_Imovel >
	( SELECT AVG(vl_Imovel)
	FROM Imovel
	WHERE cd_Bairro = I.cd_Bairro)

--Fa�a uma lista dos im�veis com o maior pre�o agrupado por bairro, cujo maior pre�o seja superior � m�dia de pre�os dos im�veis
SELECT cd_Imovel, MAX(vl_Imovel)
FROM Imovel
GROUP BY cd_Bairro, cd_Imovel
HAVING MAX(vl_Imovel) > 
	(SELECT AVG(vl_Imovel)
	FROM IMOVEL)

--Fa�a uma lista com os im�veis que tem o pre�o igual ao menor pre�o de cada vendedor.SELECT cd_Imovel, vl_ImovelFROM ImovelWHERE vl_Imovel IN 	(SELECT MIN(vl_Imovel)	FROM Imovel	GROUP BY cd_Vendedor)--Fa�a uma lista de todos os im�veis cujo Estado e Cidade sejam os mesmos do vendedor 3, exceto os im�veis do vendedor 3
SELECT cd_Imovel, cd_Cidade, sg_Estado, cd_Vendedor
FROM Imovel 
WHERE cd_Cidade = 
	(SELECT cd_Cidade FROM Imovel WHERE cd_Vendedor=3)
AND sg_Estado = 
	(SELECT sg_Estado FROM Imovel WHERE cd_Vendedor=3)
AND cd_Vendedor <> 3