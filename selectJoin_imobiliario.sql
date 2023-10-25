USE Imobiliario
go

-- Faça uma busca que mostre cd_Imovel, vl_Imovel e nm_Bairro, cujo codigo do vendedor seja 3 
SELECT I.cd_Imovel, I.vl_Imovel, B.nm_Bairro, I.cd_Vendedor
	FROM Imovel as I INNER JOIN Bairro as B
	ON I.cd_Bairro = B.cd_Bairro 
	WHERE I.cd_Vendedor = 3

-- Faça uma busca que mostre todos os imóveis que tenham ofertas cadastradas.
SELECT I.cd_Imovel, I.ds_Endereco, I.vl_Imovel
    FROM Imovel AS I INNER JOIN Oferta AS O 
    ON I.cd_Imovel = O.cd_Imovel;

--Faça uma busca que mostre todos os imóveis e ofertas mesmo que não haja ofertas cadastradas para o imóvel.
SELECT I.cd_Imovel, I.ds_Endereco, I.vl_Imovel, O.vl_Oferta, O.dt_Oferta
	FROM Imovel I LEFT JOIN Oferta O
	ON I.cd_Imovel = O.cd_Imovel

--Faça uma busca que mostre os compradores e as respectivas ofertas realizadas por eles.
SELECT C.cd_Comprador, O.vl_Oferta, O.dt_Oferta
	FROM comprador C INNER JOIN Oferta O 
	ON C.cd_Comprador = O.cd_Comprador

--Faça a mesma busca, porém acrescentando os compradores que ainda não fizeram ofertas para os imóveis.
SELECT C.cd_Comprador, O.vl_Oferta, O.dt_Oferta
	FROM comprador C LEFT JOIN Oferta O 
	ON C.cd_Comprador = O.cd_Comprador

--Faça uma busca que mostre o endereço do imóvel, o bairro e nível de preço do imóvel.


--Verifique a diferença de valores entre o maior e o menor imóvel da tabela.


--Mostre o código do vendedor e o menor valor do imóvel dele no cadastro. Exclua da busca os valores de imóveis inferiores a 10 mil.
--SELECT V.cd_Vendedor, MIN()


-- Mostre o código e o nome do comprador e a média do valor das ofertas e o número de ofertas deste comprador.
SELECT C.cd_Comprador, C.nm_Comprador, COUNT(*) AS TOTAL, AVG(O.vl_Oferta) AS MEDIA
	FROM Comprador AS C INNER JOIN Oferta as O 
	ON C.cd_Comprador = O.cd_Comprador
	GROUP BY C.cd_Comprador, C.nm_Comprador