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

-- COMMAND ----------

--Selecione os itens de pedidos e defina os grupos em uma nova coluna---
--para frete inferior 10%: '10%'
--para frete ente 10% e25% '10% a 25%'...

SELECT *,
       vlPreco + vlFrete AS vlTotal,
       vlFrete / (vlPreco + vlFrete) AS pctFrete,
       
       CASE
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.1 THEN '10%'
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% A 25%'
         WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN '25% A 50%'
         ELSE '+50%'
         END AS descFretePct
 
 FROM silver_olist.item_pedido

-- COMMAND ----------

-- Qual categoria tem mais produtos vendidos?

SELECT T2.descCategoria,
       COUNT(T1.idPedido)

FROM silver_olist.item_pedido AS T1-- tabela de vendas

LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto

GROUP BY T2.descCategoria
ORDER BY COUNT(T1.idPedido) DESC

LIMIT 1

-- COMMAND ----------

-- Qual categoria tem produtos mais caros, em média?

SELECT T2.descCategoria,
       AVG(T1.vlPreco),
       MAX(T1.vlPreco)

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.produto AS T2
ON T1.idProduto = T2.idProduto

GROUP BY T2.descCategoria
ORDER BY MAX(T1.vlPreco) DESC, AVG(T1.vlPreco)

-- COMMAND ----------

-- Os clientes de qual estado pagam mais frete?

SELECT 
       T3.descUF,
       AVG(T1.vlFrete) AS avgFrete

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.pedido AS T2
ON T1.idPedido = T2.idPedido

LEFT JOIN silver_olist.cliente AS T3
ON T2.idCliente = T3.idCliente

GROUP BY T3.descUF

HAVING avgFrete > 40


-- COMMAND ----------

--- Só quem tem frete acima de R$40,00?--
