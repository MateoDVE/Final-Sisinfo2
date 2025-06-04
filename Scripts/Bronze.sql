
DROP TABLE IF EXISTS [BRONZE].[CLIENTES];
DROP TABLE IF EXISTS [BRONZE].[CLIENTES_BD_GEN];
DROP TABLE IF EXISTS [BRONZE].[CLIENTES_LOCATION];
DROP TABLE IF EXISTS [BRONZE].[PRODUCTOS];
DROP TABLE IF EXISTS [BRONZE].[PRODUCTOS_CATEGORIAS];
DROP TABLE IF EXISTS [BRONZE].[VENTAS];

-- cst_id,cst_key,cst_firstname,cst_lastname,cst_marital_status,cst_gndr
CREATE TABLE [BRONZE].[CLIENTES] (
    cst_id VARCHAR(25),
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(10),
    cst_gndr VARCHAR(25)
)

-- CID,BDATE,GEN
CREATE TABLE [BRONZE].[CLIENTES_BD_GEN](
    cid VARCHAR(25),
    bdate VARCHAR(25),
    gen VARCHAR(25),
)

-- CID,CNTRY
CREATE TABLE [BRONZE].[CLIENTES_LOCATION](
    cid VARCHAR(25),
    cntry VARCHAR(50)
)

-- prd_id,prd_key,prd_nm,prd_cost,prd_line
CREATE TABLE [BRONZE].[PRODUCTOS] (
    prd_id VARCHAR(25),
    prd_key VARCHAR(50),
    prd_nm VARCHAR(100),
    prd_cost VARCHAR(25),
    prd_line VARCHAR(50)
)

-- ID,CAT,SUBCAT,MAINTENANCE
CREATE TABLE [BRONZE].[PRODUCTOS_CATEGORIAS] (
    id VARCHAR(25),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(25)
)


-- sls_ord_num,sls_prd_key,sls_cust_id,sls_order_dt,sls_ship_dt,sls_sales,sls_quantity,sls_price
CREATE TABLE [BRONZE].[VENTAS] (
    sls_ord_num VARCHAR(25),
    sls_prd_key VARCHAR(50),
    sls_cust_id VARCHAR(25),
    sls_order_dt VARCHAR(25),
    sls_ship_dt VARCHAR(25),
    sls_sales VARCHAR(25),
    sls_quantity VARCHAR(25),
    sls_price VARCHAR(25),
)