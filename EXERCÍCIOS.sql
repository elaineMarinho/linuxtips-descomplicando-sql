-- Databricks notebook source
-- DBTITLE 1,Exercício 01
-- 01.Selecione todos os clientes paulistanos--

SELECT *
FROM silver_olist.cliente
WHERE descCidade = 'sao paulo'

-- COMMAND ----------

-- DBTITLE 1,Exercício 02
--02.selecione todos os clientes paulistas---

SELECT*
FROM silver_olist.cliente
WHERE descUF = 'SP'


-- COMMAND ----------

-- DBTITLE 1,Exercício 03
-- 03.Selecione todos os vendedores cariocas e paulistas--

SELECT *
FROM silver_olist.vendedor
WHERE descCidade = 'rio de janeiro'
OR descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 04
-- 04.Selecione todos os produtos de perfumaria e bebê com altura maior que 5cm--

SELECT *
FROM silver_olist.produto
WHERE descCategoria IN ('perfumaria','bebes')
AND vlalturaCm > 5

