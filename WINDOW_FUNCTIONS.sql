-- Databricks notebook source
--ORDENAR DO MELHOR PARA O PIOR VENDEDOR PRO QUANTIDADE DE VENDAS POR ESTADO

WITH tb_vendas_vendedores AS (

SELECT 
     idVendedor,
     COUNT(*) AS qtVendas
     
FROM silver_olist.item_pedido

GROUP BY idVendedor
ORDER BY qtVendas DESC

)
SELECT T1.*,
       T2.descUF,
       ROW_NUMBER() OVER(PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS rn

FROM tb_vendas_vendedores AS T1

LEFT JOIN silver_olist.vendedor AS T2
ON T1. idVendedor = T2.idVendedor

ORDER BY descUF,qtVendas DESC

LIMIT 10

-- COMMAND ----------

WITH tb_vendas_vendedores AS (

SELECT 
     idVendedor,
     COUNT(*) AS qtVendas
     
FROM silver_olist.item_pedido

GROUP BY idVendedor
ORDER BY qtVendas DESC

)
SELECT T1.*,
       T2.descUF,
       ROW_NUMBER() OVER(PARTITION BY T2.descUF ORDER BY qtVendas DESC) AS rn

FROM tb_vendas_vendedores AS T1

LEFT JOIN silver_olist.vendedor AS T2
ON T1. idVendedor = T2.idVendedor

ORDER BY descUF,qtVendas DESC


