CREATE TABLE COMPANY(
   
    c_id VARCHAR(10),
    c_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(30),
    address VARCHAR(50),
    PRIMARY KEY(c_id)
);

CREATE TABLE COMPANY_PHONE(

    c_id VARCHAR(10),
    phone NUMBER(10),
    PRIMARY KEY(phone),
    FOREIGN KEY(c_id) REFERENCES COMPANY(c_id)
);

CREATE TABLE VEHICLE(

    v_code VARCHAR(10),
    v_name VARCHAR(50),
    c_id VARCHAR(10),
    PRIMARY KEY(v_code),
    FOREIGN KEY (c_id) REFERENCES COMPANY(c_id)
);

CREATE TABLE CUSTOMER__(

    cust_id NUMBER(10),
    f_name VARCHAR(30),
    l_name VARCHAR(30),
    phone NUMBER(10),
    city VARCHAR(50),
    email VARCHAR(50),
    address VARCHAR(50),
    PRIMARY KEY(cust_id)
);

CREATE TABLE SALES(

    sales_code NUMBER(10),
    cust_id NUMBER(10),
    desc_ VARCHAR(50),
    PRIMARY KEY(sales_code),
    FOREIGN KEY (cust_id) REFERENCES CUSTOMER__(cust_id)
);

CREATE TABLE VENDOR(

    ven_code NUMBER(10),
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    city VARCHAR(50),
    phone NUMBER(10),
    email VARCHAR(50),
    address VARCHAR(50),
    PRIMARY KEY(ven_code)
);

CREATE TABLE PURCHASE(

    pur_code NUMBER(10),
    ven_code NUMBER(10),
    desc_ VARCHAR(50),
    PRIMARY KEY(pur_code),
    FOREIGN KEY (ven_code) REFERENCES VENDOR(ven_code)
);

CREATE TABLE ITEM_TABLE(

    item_code NUMBER(10),
    item_name VARCHAR(50),
    purchase_price NUMBER(20),
    sale_price NUMBER(20),
    curr_stock NUMBER(10),
    PRIMARY KEY(item_code)
);

CREATE TABLE READY_FOR_SALE(

    v_code VARCHAR(10),
    item_code NUMBER(10),
    PRIMARY KEY(v_code,item_code),
    FOREIGN KEY (v_code) REFERENCES VEHICLE(v_code),
    FOREIGN KEY (item_code) REFERENCES ITEM_TABLE(item_code)
);

CREATE TABLE PURCHASE_TRANS(

    pur_code NUMBER(10),
    item_code NUMBER(10),
    qty NUMBER(10),
    amount NUMBER(20),
    PRIMARY KEY(pur_code,item_code),
    FOREIGN KEY (pur_code) REFERENCES PURCHASE(pur_code),
    FOREIGN KEY (item_code) REFERENCES ITEM_TABLE(item_code)
);

CREATE TABLE SALES_TRANS(

    sales_code NUMBER(10),
    item_code NUMBER(10),
    qty NUMBER(10),
    amount NUMBER(20),
    PRIMARY KEY (sales_code,item_code),
    FOREIGN KEY (sales_code) REFERENCES SALES(sales_code),
    FOREIGN KEY (item_code) REFERENCES ITEM_TABLE(item_code)
);