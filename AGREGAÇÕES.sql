-- Databricks notebook source
--QUANTOS CLIENTES TEMOS? --

SELECT count(*) AS nrLInhaNaoNulas -- linhas não nulas
FROM silver_olist.cliente

-- COMMAND ----------

--QUANTOS CLIENTES TEMOS? --

SELECT
count(*) AS nrLInhaNaoNulas, -- linhas não nulas
count(idCliente) AS nrLInhaNaoNulas --id de clientes não nulos
FROM silver_olist.cliente

-- COMMAND ----------

SELECT
count(*) AS nrLInhaNaoNulas, -- linhas não nulas
count(idCliente) AS nrLInhaNaoNulas, --id de clientes não nulos
count(distinct idCliente) AS nrLInhaClientesDistintos -- id de clientes distintos 
FROM silver_olist.cliente

-- COMMAND ----------

SELECT
     COUNT(*) AS nrLInhaNaoNulas, -- linhas não nulas
     COUNT(idCliente) AS nrLInhaNaoNulas, --id de clientes não nulos
     COUNT(distinct idCliente) AS nrLInhaClientesDistintos, -- id de clientes distintos 

     COUNT(IdClienteUnico) AS nrIdClienteUnico,
     COUNT(distinct IdClienteUnico) AS nrIdClienteUnicoDistintos -- conta id de clientes unicos distintos

FROM silver_olist.cliente

-- COMMAND ----------

SELECT
      COUNT(*) AS qtLinhas,
      COUNT(distinct idCliente) AS qtClientes,
      COUNT(distinct idClienteUnico) AS qtClientesUnicos
      
FROM silver_olist.cliente
WHERE descCidade IN ('Presidente prudente','curitiba') 


-- COMMAND ----------

SELECT
     PERCENTILE(VLpRECO, 0.5) as medianPreco,   
     MAX(vLPreco) AS maxPreco,
     AVG(vlFrete) AS avgFrete,
     MAX(vLFrete) AS maxFrete,
     MIN(vLFrete) AS minFrete
     
FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT
     ROUND(AVG(vlPreco), 2) AS avgPreco,
     
     INT(PERCENTILE(VLpRECO, 0.5)) as medianPreco,   
     MAX(vLPreco) AS maxPreco,
     AVG(vlFrete) AS avgFrete,
     MAX(vLFrete) AS maxFrete,
     MIN(vLFrete) AS minFrete
     
FROM silver_olist.item_pedido

-- COMMAND ----------

SELECT COUNT(*)
FROM Silver_olist.cliente
WHERE descUF = 'SC'
