Use IMOBILIARIO
go

-- Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfabética decrescente.
select cd_Vendedor, nm_Vendedor, ds_Email
	FROM VENDEDOR
	ORDER BY nm_Vendedor DESC

-- Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis do vendedor 2.
select cd_Imovel, cd_Vendedor, vl_Imovel
	FROM IMOVEL 
	WHERE cd_Vendedor = 2

--Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.
select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
	FROM IMOVEL
	WHERE vl_Imovel < 150000 AND sg_Estado = 'RJ'

--Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e o vendedor não seja 2.
select cd_Imovel, cd_Vendedor, vl_Imovel, sg_Estado
	FROM IMOVEL
	WHERE vl_Imovel < 150000 AND cd_Vendedor <> 2

--Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.
select cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado
	FROM COMPRADOR
	WHERE sg_Estado IS NULL

--Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil.
select * 
	FROM Oferta
	WHERE vl_Oferta BETWEEN 100000 AND 150000

-- Liste todos os vendedores que tenham a letra A na segunda posição do nome
select nm_Vendedor
	FROM VENDEDOR 
	WHERE nm_Vendedor like '_A%'

--Liste o total de ofertas por comprador de 2022 a 2023
select cd_Comprador, SUM(vl_Oferta) as Total
	from Oferta
	Where YEAR(dt_Oferta) Between 2022 and 2023
	group by cd_Comprador with Rollup
go

--Liste o valor médio de todos os Imóveis por bairro, somente do estado de São Paulo e coloque o resultado em ordem decrescente de valor.
select cd_Bairro, cd_Cidade, sg_Estado, AVG(vl_Imovel) as total
	from Imovel
	group by cd_Bairro, cd_Cidade, sg_Estado
	having sg_Estado = 'SP'
	order by total desc
go

--Liste o maior valor de imóvel por vendedor, somente para os vendedores 1 e 2.
select cd_Vendedor, MAX(vl_Imovel) as Maior
	from Imovel
	group by cd_Vendedor
	having cd_Vendedor in (1,2)
go

--Mostre a quantidade de imóveis cujo preço de venda seja inferior a 150 mil por Estado e a área total inferior a 300.
select sg_Estado, count(*) as total
	from Imovel
	where vl_Imovel < 150000 and qt_AreaTotal < 300
	group by sg_Estado
