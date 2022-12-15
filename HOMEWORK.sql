-- Databricks notebook source
--Lista de pedidos feitos em dezembro de 2017 e entregues com atraso --

SELECT *
FROM silver_olist.pedido

WHERE YEAR (dtPedido) = 2017
AND MONTH(dtPedido) = 12
AND descSituacao = 'delivered'
AND date(dtEntregue) > date(dtEstimativaEntrega)

-- COMMAND ----------

--Lista de pedidos  com 2 ou mais parcelas menores que R$20,00--

SELECT *,
       ROUND(vlPagamento / nrPacelas,2) AS vlPacela
FROM silver_olist.pagamento_pedido
WHERE nrPacelas >= 2
AND vlPagamento / nrPacelas < 20
