-- Databricks notebook source
SELECT * FROM silver_olist.pedido

-- leia-se: selecione tudo da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido
FROM silver_olist.pedido

--- leia-se: selecione a coluna idPedido da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido,
       descSituacao
FROM silver_olist.pedido

--- leia-se: selecione a coluna idPedido e descSituação da tabela silver_olist.pedido

-- COMMAND ----------

SELECT idPedido,
       descSituacao
FROM silver_olist.pedido

LIMIT 5

--- leia-se: selecione a coluna idPedido e descSituação da tabela silver_olist.pedido *LIMITADO A 5 RESULTADOS ALEATÓRIOS*

-- COMMAND ----------

SELECT *,
       DATEDIFF(dtEstimativaEntrega, dtEntregue) AS qtDiasPromessaEntrega
FROM silver_olist.pedido
LIMIT 5

--leia-se: selecione da tabela silver_olist.pedido quantidade de dias promessa de entrega (DIAS ENTRE DATAS)

