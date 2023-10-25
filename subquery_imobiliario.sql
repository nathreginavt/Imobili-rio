USE IMOBILIARIO
go

--Faça uma lista de imóveis do mesmo bairro do imóvel 2. 
--Exclua o imóvel 2 da sua busca
SELECT cd_Imovel, cd_Bairro, cd_Cidade, sg_Estado
FROM Imovel 
WHERE cd_Bairro = 
	(SELECT cd_Bairro FROM Imovel WHERE cd_Imovel=2)
AND cd_Cidade = 
	(SELECT cd_Cidade FROM Imovel WHERE cd_Imovel=2)
AND sg_Estado = 
	(SELECT sg_Estado FROM Imovel WHERE cd_Imovel = 2)
AND cd_Imovel <> 2

-- Faça uma lista que mostre todos os imóveis que custam mais que a média de preço dos imóveis.
SELECT cd_Imovel, vl_Imovel
FROM Imovel
WHERE vl_Imovel >
	(SELECT AVG(vl_Imovel) 
	FROM Imovel)

--Faça uma lista com todos os imóveis com preço superior à média de preço dos imóveis do mesmo bairro.
SELECT cd_Bairro, cd_Imovel, vl_Imovel
FROM Imovel AS I
WHERE vl_Imovel >
	( SELECT AVG(vl_Imovel)
	FROM Imovel
	WHERE cd_Bairro = I.cd_Bairro)

--Faça uma lista dos imóveis com o maior preço agrupado por bairro, cujo maior preço seja superior à média de preços dos imóveis
SELECT cd_Imovel, MAX(vl_Imovel)
FROM Imovel
GROUP BY cd_Bairro, cd_Imovel
HAVING MAX(vl_Imovel) > 
	(SELECT AVG(vl_Imovel)
	FROM IMOVEL)

--Faça uma lista com os imóveis que tem o preço igual ao menor preço de cada vendedor.SELECT cd_Imovel, vl_ImovelFROM ImovelWHERE vl_Imovel IN 	(SELECT MIN(vl_Imovel)	FROM Imovel	GROUP BY cd_Vendedor)--Faça uma lista de todos os imóveis cujo Estado e Cidade sejam os mesmos do vendedor 3, exceto os imóveis do vendedor 3
SELECT cd_Imovel, cd_Cidade, sg_Estado, cd_Vendedor
FROM Imovel 
WHERE cd_Cidade = 
	(SELECT cd_Cidade FROM Imovel WHERE cd_Vendedor=3)
AND sg_Estado = 
	(SELECT sg_Estado FROM Imovel WHERE cd_Vendedor=3)
AND cd_Vendedor <> 3