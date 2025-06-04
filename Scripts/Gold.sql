DROP TABLE IF EXISTS [GOLD].[HECHOS_VENTAS];
DROP TABLE IF EXISTS [GOLD].[DIM_CLIENTES];
DROP TABLE IF EXISTS [GOLD].[DIM_PRODUCTOS];

-- cst_id,cst_key,cst_firstname,cst_lastname,cst_marital_status,cst_gndr
CREATE TABLE [GOLD].[DIM_CLIENTES] (
    cst_id INTEGER,
    -- PRIMARY KEY (cst_id)
)

-- prd_id,prd_key,prd_nm,prd_cost,prd_line
CREATE TABLE [GOLD].[DIM_PRODUCTOS] (
    prd_key VARCHAR(50),
    PRIMARY KEY (prd_key),
)


-- sls_ord_num,sls_prd_key,sls_cust_id,sls_order_dt,sls_ship_dt,sls_sales,sls_quantity,sls_price
CREATE TABLE [GOLD].[HECHOS_VENTAS] (
    sls_ord_id INTEGER PRIMARY KEY IDENTITY(1,1),
    sls_ord_num VARCHAR(25),
    sls_prd_key VARCHAR(50),
    sls_cust_id INTEGER,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT,
    -- CONSTRAINT FK_VENTAS_CLIENTES FOREIGN KEY (sls_cust_id) REFERENCES [GOLD].[DIM_CLIENTES](cst_id)
);