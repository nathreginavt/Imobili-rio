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
--SELECT I.cd_Imovel, I.ds_Endereco, I.vl_Imovel, O.cd_Comprador, 