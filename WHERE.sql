-- Databricks notebook source
SELECT *
FROM silver_olist.pedido

WHERE descSituacao = 'canceled'
--LIMIT 100

--leia-se: selecione todas colunas da tabela silver_olist.pedido onde a situação do pedido seja entegue 'delivered' ou 'canceled'...

-- COMMAND ----------

SELECT *
FROM silver_olist.pedido

WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled')
AND year(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos enviados ou cancelados de 2018

-- COMMAND ----------

SELECT *
FROM silver_olist.pedido

WHERE descSituacao IN ('shipped','canceled') 
AND year(dtPedido) = '2018'
-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos enviados ou cancelados de 2018

-- COMMAND ----------

SELECT *,
       datediff(dtEstimativaEntrega, dtAprovado) AS diffDatasAprovadoPrevisao
FROM silver_olist.pedido

WHERE descSituacao IN ('shipped','canceled') 
AND year(dtPedido) = '2018'
AND datediff(dtEstimativaEntrega, dtAprovado) > 30

-- leia-se: selecione todas as colunas da tabela silver_olist.pedido filtrando pedidos em atraso com estimativa de 30 dias
