DROP TABLE IF EXISTS [SILVER].[CLIENTES];
DROP TABLE IF EXISTS [SILVER].[CLIENTES_BD-GEN];
DROP TABLE IF EXISTS [SILVER].[CLIENTES_LOCATION];
DROP TABLE IF EXISTS [SILVER].[PRODUCTOS];
DROP TABLE IF EXISTS [SILVER].[PRODUCTOS_CATEGORIAS];
DROP TABLE IF EXISTS [SILVER].[VENTAS];

-- cst_id,cst_key,cst_firstname,cst_lastname,cst_marital_status,cst_gndr
CREATE TABLE [SILVER].[CLIENTES] (
    cst_id INTEGER,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
)

/*

select cst_id, cst_key, cst_firstname, cst_lastname
from BRONZE.CLIENTES

*/

-- CID,BDATE,GEN
CREATE TABLE [SILVER].[CLIENTES_BD_GEN](
    cid VARCHAR(25),
    bdate DATE
)

/*

select cid, bdate
from BRONZE.CLIENTES_BD_GEN

*/

-- CID,CNTRY
CREATE TABLE [SILVER].[CLIENTES_LOCATION](
    cid VARCHAR(25),
    cntry VARCHAR(50)
)

/*

select *
from BRONZE.CLIENTES_LOCATION

*/

-- prd_id,prd_key,prd_nm,prd_cost,prd_line
CREATE TABLE [SILVER].[PRODUCTOS] (
    prd_id INTEGER,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(100),
    prd_cost INT,
)

/*

select prd_id, prd_key, prd_nm, prd_cost
from BRONZE.PRODUCTOS

*/

-- ID,CAT,SUBCAT,MAINTENANCE
CREATE TABLE [SILVER].[PRODUCTOS_CATEGORIAS] (
    id VARCHAR(25),
    subcat VARCHAR(50)
)

/*
select id, subcat
from BRONZE.PRODUCTOS_CATEGORIAS
*/

-- sls_ord_num,sls_prd_key,sls_cust_id,sls_order_dt,sls_ship_dt,sls_sales,sls_quantity,sls_price
CREATE TABLE [SILVER].[VENTAS] (
    sls_ord_num VARCHAR(25),
    sls_prd_key VARCHAR(50),
    sls_cust_id INTEGER,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
)

/*
select sls_ord_num, sls_prd_key, sls_cust_id, sls_sales, sls_quantity, sls_price
from BRONZE.VENTAS
*/