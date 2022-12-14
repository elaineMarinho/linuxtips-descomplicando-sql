-- Databricks notebook source
SELECT 
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente

GROUP BY descUF
ORDER BY descUF

-- COMMAND ----------

---primeira forma--
SELECT 
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente

GROUP BY descUF
ORDER BY 2

-- COMMAND ----------

--segunda forma--

SELECT 
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente

GROUP BY descUF
ORDER BY qtClienteEstado

-- COMMAND ----------

--terceira forma--

SELECT 
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente

GROUP BY descUF
ORDER BY COUNT(DISTINCT idClienteUnico)

-- COMMAND ----------

--ordenar de forma decrescente--
SELECT 
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente

GROUP BY descUF
ORDER BY qtClienteEstado DESC

-- COMMAND ----------

--APENAS A PRIMEIRA LINHA--
SELECT 
  descUF,
  COUNT(DISTINCT idClienteUnico) AS qtClienteEstado
FROM silver_olist.cliente

GROUP BY descUF
ORDER BY qtClienteEstado DESC

LIMIT 1
