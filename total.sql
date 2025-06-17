-- 建立 Customers 資料表
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Street VARCHAR(200),
    City VARCHAR(100),
    PostalCode VARCHAR(10),
    Country VARCHAR(100)
);

-- 建立 Products 資料表
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductDescription TEXT,
    UnitPrice DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    SupplierName VARCHAR(100),
    SupplierContact VARCHAR(100)
);

-- 建立 Orders 資料表
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    OrderTotalAmount DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 建立 OrderItems 訂單明細
CREATE TABLE OrderItems (
    OrderID INT,
    ProductID INT,
    PurchaseQuantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



-- 插入或更新顧客資料 (UPSERT)
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, Street, City, PostalCode, Country)
VALUES (1, '王小明', 'ming.wang@example.com', '0912345678', '中山路100號', '台北市', '100', '台灣')
ON DUPLICATE KEY UPDATE
    CustomerName = VALUES(CustomerName),
    Email = VALUES(Email),
    Phone = VALUES(Phone),
    Street = VALUES(Street),
    City = VALUES(City),
    PostalCode = VALUES(PostalCode),
    Country = VALUES(Country);

INSERT INTO Products (ProductID, ProductName, ProductDescription, UnitPrice, StockQuantity, SupplierName, SupplierContact)
VALUES (1, '電腦螢幕', '24吋全高清液晶顯示器', 4500.00, 100, '宏達科技', 'supplier@ht.com')
ON DUPLICATE KEY UPDATE
    ProductName = VALUES(ProductName),
    ProductDescription = VALUES(ProductDescription),
    UnitPrice = VALUES(UnitPrice),
    StockQuantity = VALUES(StockQuantity),
    SupplierName = VALUES(SupplierName),
    SupplierContact = VALUES(SupplierContact);

-- 插入多筆顧客
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, Street, City, PostalCode, Country)
VALUES 
(2, '林小華', 'lin.hua@example.com', '0911222333', '和平東路200號', '新北市', '220', '台灣'),
(3, '張三', 'zhang.san@example.com', '0988777666', '民生路50號', '台中市', '400', '台灣');

-- 插入多筆商品
INSERT INTO Products (ProductID, ProductName, ProductDescription, UnitPrice, StockQuantity, SupplierName, SupplierContact)
VALUES 
(2, '滑鼠', '無線滑鼠', 800.00, 50, '聯想科技', 'supplier@lenovo.com'),
(3, '鍵盤', '機械式鍵盤', 1500.00, 70, '微星科技', 'supplier@msi.com');




-- Customers 測試資料 (含 UPSERT 機制)
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, Street, City, PostalCode, Country)
VALUES (1, '王小明', 'ming.wang@example.com', '0912345678', '中山路100號', '台北市', '100', '台灣')
ON DUPLICATE KEY UPDATE
    CustomerName=VALUES(CustomerName), Phone=VALUES(Phone),
    Street=VALUES(Street), City=VALUES(City),
    PostalCode=VALUES(PostalCode), Country=VALUES(Country);

INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, Street, City, PostalCode, Country)
VALUES (2, '林小華', 'lin.hua@example.com', '0911222333', '和平東路200號', '新北市', '220', '台灣')
ON DUPLICATE KEY UPDATE
    CustomerName=VALUES(CustomerName), Phone=VALUES(Phone),
    Street=VALUES(Street), City=VALUES(City),
    PostalCode=VALUES(PostalCode), Country=VALUES(Country);

INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, Street, City, PostalCode, Country)
VALUES (3, '張三', 'zhang.san@example.com', '0988777666', '民生路50號', '台中市', '400', '台灣')
ON DUPLICATE KEY UPDATE
    CustomerName=VALUES(CustomerName), Phone=VALUES(Phone),
    Street=VALUES(Street), City=VALUES(City),
    PostalCode=VALUES(PostalCode), Country=VALUES(Country);



-- 顧客資料表
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Street VARCHAR(200),
    City VARCHAR(100),
    PostalCode VARCHAR(10),
    Country VARCHAR(100)
);

-- 商品資料表
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductDescription TEXT,
    UnitPrice DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    SupplierName VARCHAR(100),
    SupplierContact VARCHAR(100)
);

-- 訂單資料表
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    OrderTotalAmount DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 訂單明細資料表
CREATE TABLE IF NOT EXISTS OrderItems (
    OrderID INT,
    ProductID INT,
    PurchaseQuantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 顧客資料 UPSERT 批次產生
INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, Street, City, PostalCode, Country)
VALUES
(1, '王小明', 'ming.wang@example.com', '0912345678', '中山路100號', '台北市', '100', '台灣'),
(2, '陳美玲', 'meiling.chen@example.com', '0911222333', '仁愛路88號', '新北市', '220', '台灣'),
(3, '林志豪', 'zhihao.lin@example.com', '0933444555', '和平東路200號', '台中市', '400', '台灣'),
(4, '劉雅婷', 'yating.liu@example.com', '0922333444', '忠孝西路500號', '高雄市', '800', '台灣'),
(5, '黃建國', 'jianguo.huang@example.com', '0919988776', '南京東路80號', '台北市', '105', '台灣'),
(6, '曾淑芬', 'shufen.tseng@example.com', '0913456789', '八德路三段66號', '台北市', '104', '台灣'),
(7, '吳宗憲', 'zongxian.wu@example.com', '0923344556', '羅斯福路10段', '新竹市', '300', '台灣'),
(8, '徐乃麟', 'nailin.hsu@example.com', '0915678234', '長春路101號', '台中市', '401', '台灣'),
(9, '趙麗穎', 'liy.cho@example.com', '0955678234', '光復南路88巷', '台南市', '700', '台灣'),
(10, '宋慧喬', 'hye.kyo@example.com', '0987654321', '文心南路123號', '高雄市', '802', '台灣'),
(11, '李大仁', 'daren.li@example.com', '0919283746', '仁德路1號', '台北市', '106', '台灣'),
(12, '張小英', 'xiaoying.zhang@example.com', '0978223344', '金山南路88巷', '新北市', '220', '台灣'),
(13, '周杰倫', 'jay.chou@example.com', '0966999888', '八德路四段199號', '台北市', '105', '台灣'),
(14, '林志玲', 'chiling.lin@example.com', '0911229988', '忠孝東路五段120號', '台中市', '403', '台灣'),
(15, '郭富城', 'aaron.kwok@example.com', '0928777666', '新生南路90號', '台北市', '106', '台灣'),
(16, '陳奕迅', 'eason.chan@example.com', '0938223344', '愛國西路66號', '新北市', '220', '台灣'),
(17, '楊丞琳', 'rainie.yang@example.com', '0966778899', '民生東路3段50號', '台北市', '105', '台灣'),
(18, '范冰冰', 'bingbing.fan@example.com', '0977885566', '南港路88號', '新竹市', '300', '台灣'),
(19, '彭于晏', 'eddie.peng@example.com', '0919887766', '博愛路45巷', '台中市', '400', '台灣'),
(20, '舒淇', 'shu.qi@example.com', '0933445566', '金門路88號', '台南市', '700', '台灣'),
(21, '郭雪芙', 'hsuehfu.kuo@example.com', '0911234567', '信義路五段555號', '台北市', '110', '台灣'),
(22, '炎亞綸', 'aaron.yan@example.com', '0977881234', '市民大道一段', '台北市', '100', '台灣'),
(23, '陳喬恩', 'qiaoen.chen@example.com', '0922773344', '成功路23巷', '新北市', '221', '台灣'),
(24, '羅志祥', 'show.luo@example.com', '0915667788', '長安東路101號', '台北市', '104', '台灣'),
(25, '林俊傑', 'jj.lin@example.com', '0912983476', '新興路8號', '高雄市', '800', '台灣'),
(26, '張惠妹', 'amei.chang@example.com', '0929887654', '文化路一段88號', '台中市', '403', '台灣'),
(27, '王心凌', 'cyndi.wang@example.com', '0977883344', '成功路三段120號', '新北市', '220', '台灣'),
(28, '楊宗緯', 'zongwei.yang@example.com', '0916678899', '民族路二段10號', '台南市', '700', '台灣'),
(29, '蔡依林', 'jolin.tsai@example.com', '0933447788', '建國北路22號', '台北市', '105', '台灣'),
(30, '賴欣怡', 'xinyi.lai@example.com', '0977665543', '光復南路100巷', '新竹市', '300', '台灣')
ON DUPLICATE KEY UPDATE 
    CustomerName=VALUES(CustomerName),
    Phone=VALUES(Phone),
    Street=VALUES(Street),
    City=VALUES(City),
    PostalCode=VALUES(PostalCode),
    Country=VALUES(Country);


INSERT INTO Products (ProductID, ProductName, ProductDescription, UnitPrice, StockQuantity, SupplierName, SupplierContact)
VALUES
(1, '電腦螢幕', '24吋全高清液晶顯示器', 4500.00, 100, '宏達科技', 'supplier1@example.com'),
(2, '滑鼠', '無線光學滑鼠', 800.00, 200, '羅技科技', 'supplier2@example.com'),
(3, '鍵盤', '機械式鍵盤', 1500.00, 150, '微星科技', 'supplier3@example.com'),
(4, '耳機', '降噪藍牙耳機', 3200.00, 80, 'Sony', 'supplier4@example.com'),
(5, '手機支架', '多角度可調手機支架', 500.00, 300, '小米科技', 'supplier5@example.com'),
(6, '充電器', '快速充電器', 900.00, 250, '三星電子', 'supplier6@example.com'),
(7, '行動電源', '20000mAh 超大容量', 1200.00, 120, 'ASUS', 'supplier7@example.com'),
(8, '筆記型電腦', '14吋輕薄筆電', 32000.00, 50, '宏碁科技', 'supplier8@example.com'),
(9, '桌上型主機', '高效能電競主機', 48000.00, 30, '技嘉科技', 'supplier9@example.com'),
(10, '印表機', '多功能雷射印表機', 6500.00, 40, 'HP', 'supplier10@example.com'),
(11, '顯示卡', 'RTX 4060Ti', 25000.00, 60, 'NVIDIA', 'supplier11@example.com'),
(12, '固態硬碟', '1TB NVMe SSD', 4000.00, 100, '三星電子', 'supplier12@example.com'),
(13, '記憶體', '32GB DDR5', 6000.00, 80, '金士頓', 'supplier13@example.com'),
(14, 'CPU', 'Intel i9-13900K', 21000.00, 40, 'Intel', 'supplier14@example.com'),
(15, '散熱器', '水冷散熱器', 3500.00, 70, 'Cooler Master', 'supplier15@example.com'),
(16, '電源供應器', '850W 金牌', 4500.00, 50, 'Seasonic', 'supplier16@example.com'),
(17, '主機板', 'Z790 主機板', 11000.00, 45, 'ASUS', 'supplier17@example.com'),
(18, '鍵盤保護膜', '矽膠防塵膜', 300.00, 150, '副廠配件', 'supplier18@example.com'),
(19, '滑鼠墊', '加厚滑鼠墊', 500.00, 100, '副廠配件', 'supplier19@example.com'),
(20, '網路分享器', 'Wi-Fi 6 路由器', 3800.00, 90, 'TP-Link', 'supplier20@example.com'),
(21, '藍芽喇叭', '小型藍芽音響', 2500.00, 80, 'JBL', 'supplier21@example.com'),
(22, 'USB集線器', '多孔USB3.0集線器', 600.00, 120, 'Anker', 'supplier22@example.com'),
(23, '外接硬碟', '2TB 外接硬碟', 3200.00, 70, 'WD', 'supplier23@example.com'),
(24, '監視攝影機', '智慧家庭監視器', 5800.00, 50, '小米科技', 'supplier24@example.com'),
(25, '掃地機器人', '智慧型掃地機器人', 9800.00, 40, 'Roborock', 'supplier25@example.com'),
(26, 'VR眼鏡', '虛擬實境頭戴裝置', 18500.00, 30, 'Meta', 'supplier26@example.com'),
(27, '無人機', '航拍無人機', 32800.00, 20, 'DJI', 'supplier27@example.com'),
(28, '3D列印機', '家用3D列印機', 15800.00, 15, 'Anycubic', 'supplier28@example.com'),
(29, '電子書閱讀器', '6吋電子書', 6800.00, 60, 'Kobo', 'supplier29@example.com'),
(30, '智慧手錶', '健康監測智慧手錶', 8800.00, 100, 'Apple', 'supplier30@example.com')
ON DUPLICATE KEY UPDATE 
    ProductName=VALUES(ProductName),
    ProductDescription=VALUES(ProductDescription),
    UnitPrice=VALUES(UnitPrice),
    StockQuantity=VALUES(StockQuantity),
    SupplierName=VALUES(SupplierName),
    SupplierContact=VALUES(SupplierContact);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
VALUES
(1, 1, '2024-06-01', 15000.00),
(2, 3, '2024-06-02', 9800.00),
(3, 5, '2024-06-03', 3200.00),
(4, 7, '2024-06-04', 4500.00),
(5, 9, '2024-06-05', 17800.00),
(6, 11, '2024-06-06', 25000.00),
(7, 13, '2024-06-07', 8900.00),
(8, 15, '2024-06-08', 4300.00),
(9, 17, '2024-06-09', 10500.00),
(10, 19, '2024-06-10', 6000.00)
ON DUPLICATE KEY UPDATE 
    CustomerID=VALUES(CustomerID),
    OrderDate=VALUES(OrderDate),
    OrderTotalAmount=VALUES(OrderTotalAmount);


INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
VALUES
(1, 1, 2, 4500.00),
(1, 2, 1, 800.00),
(1, 3, 1, 1500.00),

(2, 4, 1, 3200.00),
(2, 5, 2, 500.00),
(2, 6, 1, 900.00),

(3, 7, 1, 1200.00),
(3, 8, 1, 32000.00),

(4, 9, 1, 48000.00),
(4, 10, 1, 6500.00),

(5, 11, 1, 25000.00),
(5, 12, 1, 4000.00),
(5, 13, 2, 6000.00),

(6, 14, 1, 21000.00),
(6, 15, 1, 3500.00),
(6, 16, 1, 4500.00),

(7, 17, 1, 11000.00),
(7, 18, 2, 300.00),
(7, 19, 1, 500.00),

(8, 20, 1, 3800.00),
(8, 21, 1, 2500.00),

(9, 22, 1, 600.00),
(9, 23, 1, 3200.00),
(9, 24, 1, 5800.00),

(10, 25, 1, 9800.00),
(10, 26, 1, 18500.00),
(10, 27, 1, 32800.00),
(10, 28, 1, 15800.00),
(10, 29, 1, 6800.00),
(10, 30, 1, 8800.00)
ON DUPLICATE KEY UPDATE 
    PurchaseQuantity=VALUES(PurchaseQuantity),
    UnitPrice=VALUES(UnitPrice);








-- 開始交易
START TRANSACTION;

-- 插入一筆訂單
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
VALUES (1, 1, CURDATE(), 10000.00);

-- 插入訂單明細
INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
VALUES 
(1, 1, 2, 4500.00),
(1, 2, 1, 800.00);

-- 模擬錯誤 (例如故意插入不存在的產品ID，會產生外鍵錯誤)
-- INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice) VALUES (1, 999, 1, 500.00);

-- 若以上皆成功，提交交易
COMMIT;

-- 若中間有錯誤，可用 ROLLBACK 取消整筆交易：
-- ROLLBACK;


查看顧客資料（Customers）
SELECT * FROM Customers;
查看商品資料（Products）
SELECT * FROM Products;
查看訂單資料（Orders）
SELECT * FROM Orders;
查看訂單明細（OrderItems）
SELECT * FROM OrderItems;



顧客訂單總額報表
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.OrderTotalAmount) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC;


商品銷售排行榜
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(oi.PurchaseQuantity) AS TotalSold,
    SUM(oi.PurchaseQuantity * oi.UnitPrice) AS TotalRevenue
FROM Products p
JOIN OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC;

查出每天的總銷售額
SELECT 
    OrderDate,
    SUM(OrderTotalAmount) AS DailyRevenue
FROM Orders
GROUP BY OrderDate
ORDER BY OrderDate;


SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerName,
    p.ProductName,
    oi.PurchaseQuantity,
    oi.UnitPrice,
    (oi.PurchaseQuantity * oi.UnitPrice) AS SubTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
ORDER BY o.OrderID;


CREATE OR REPLACE VIEW OrderDetailView AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerName,
    p.ProductName,
    oi.PurchaseQuantity,
    oi.UnitPrice,
    (oi.PurchaseQuantity * oi.UnitPrice) AS SubTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;

SELECT * FROM OrderDetailView;




-- 開始交易
START TRANSACTION;

-- 插入訂單
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
VALUES (11, 5, CURDATE(), 0);  -- 總金額先放 0

-- 插入訂單明細 (多商品)
INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
VALUES 
(11, 2, 2, 800.00),
(11, 3, 1, 1500.00);

-- 更新訂單總金額 (先算出明細總額)
UPDATE Orders
SET OrderTotalAmount = (
    SELECT SUM(PurchaseQuantity * UnitPrice)
    FROM OrderItems
    WHERE OrderID = 11
)
WHERE OrderID = 11;

-- 如果上述全部執行成功，提交交易
COMMIT;

-- 如果過程中任何一行出錯，可以手動回滾
-- ROLLBACK;


DELIMITER $$

CREATE PROCEDURE CreateOrder(
    IN inOrderID INT,
    IN inCustomerID INT,
    IN inOrderDate DATE,
    IN inProductID1 INT, IN inQuantity1 INT, IN inUnitPrice1 DECIMAL(10,2),
    IN inProductID2 INT, IN inQuantity2 INT, IN inUnitPrice2 DECIMAL(10,2)
)
BEGIN
    START TRANSACTION;

    INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
    VALUES (inOrderID, inCustomerID, inOrderDate, 0);

    INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
    VALUES 
        (inOrderID, inProductID1, inQuantity1, inUnitPrice1),
        (inOrderID, inProductID2, inQuantity2, inUnitPrice2);

    UPDATE Orders
    SET OrderTotalAmount = (
        SELECT SUM(PurchaseQuantity * UnitPrice)
        FROM OrderItems
        WHERE OrderID = inOrderID
    )
    WHERE OrderID = inOrderID;

    COMMIT;
END$$

DROP PROCEDURE IF EXISTS CreateOrder;

CREATE PROCEDURE CreateOrder(
    IN inOrderID INT,
    IN inCustomerID INT,
    IN inOrderDate DATE,
    IN inProductID1 INT, IN inQuantity1 INT, IN inUnitPrice1 DECIMAL(10,2),
    IN inProductID2 INT, IN inQuantity2 INT, IN inUnitPrice2 DECIMAL(10,2)
)
BEGIN
    START TRANSACTION;

    INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
    VALUES (inOrderID, inCustomerID, inOrderDate, 0);

    INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
    VALUES 
        (inOrderID, inProductID1, inQuantity1, inUnitPrice1),
        (inOrderID, inProductID2, inQuantity2, inUnitPrice2);

    UPDATE Orders
    SET OrderTotalAmount = (
        SELECT SUM(PurchaseQuantity * UnitPrice)
        FROM OrderItems
        WHERE OrderID = inOrderID
    )
    WHERE OrderID = inOrderID;

    COMMIT;
END;
DROP TRIGGER IF EXISTS ReduceStock;

CREATE TRIGGER ReduceStock AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products
    SET StockQuantity = StockQuantity - NEW.PurchaseQuantity
    WHERE ProductID = NEW.ProductID;
END;





-- Customers
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Street VARCHAR(200),
    City VARCHAR(100),
    PostalCode VARCHAR(10),
    Country VARCHAR(100)
);

-- Products
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    ProductDescription TEXT,
    UnitPrice DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    SupplierName VARCHAR(100),
    SupplierContact VARCHAR(100)
);

-- Orders
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    OrderTotalAmount DECIMAL(12,2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderItems
CREATE TABLE IF NOT EXISTS OrderItems (
    OrderID INT,
    ProductID INT,
    PurchaseQuantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);








CREATE OR REPLACE VIEW OrderDetailView AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerName,
    p.ProductName,
    oi.PurchaseQuantity,
    oi.UnitPrice,
    (oi.PurchaseQuantity * oi.UnitPrice) AS SubTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;


顧客消費總額：
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.OrderTotalAmount) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC;





START TRANSACTION;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
VALUES (100, 3, CURDATE(), 0);

INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
VALUES 
(100, 2, 2, 800.00),
(100, 3, 1, 1500.00);

UPDATE Orders
SET OrderTotalAmount = (
    SELECT SUM(PurchaseQuantity * UnitPrice)
    FROM OrderItems
    WHERE OrderID = 100
)
WHERE OrderID = 100;

COMMIT;









DROP PROCEDURE IF EXISTS CreateOrder;

CREATE PROCEDURE CreateOrder(
    IN inOrderID INT,
    IN inCustomerID INT,
    IN inOrderDate DATE,
    IN inProductID1 INT, IN inQuantity1 INT, IN inUnitPrice1 DECIMAL(10,2),
    IN inProductID2 INT, IN inQuantity2 INT, IN inUnitPrice2 DECIMAL(10,2)
)
BEGIN
    START TRANSACTION;

    INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
    VALUES (inOrderID, inCustomerID, inOrderDate, 0);

    INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
    VALUES 
        (inOrderID, inProductID1, inQuantity1, inUnitPrice1),
        (inOrderID, inProductID2, inQuantity2, inUnitPrice2);

    UPDATE Orders
    SET OrderTotalAmount = (
        SELECT SUM(PurchaseQuantity * UnitPrice)
        FROM OrderItems
        WHERE OrderID = inOrderID
    )
    WHERE OrderID = inOrderID;

    COMMIT;
END;








DROP PROCEDURE IF EXISTS CreateOrder;

CREATE PROCEDURE CreateOrder(
    IN inOrderID INT,
    IN inCustomerID INT,
    IN inOrderDate DATE,
    IN inProductID1 INT, IN inQuantity1 INT, IN inUnitPrice1 DECIMAL(10,2),
    IN inProductID2 INT, IN inQuantity2 INT, IN inUnitPrice2 DECIMAL(10,2)
)
BEGIN
    INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderTotalAmount)
    VALUES (inOrderID, inCustomerID, inOrderDate, 0);

    INSERT INTO OrderItems (OrderID, ProductID, PurchaseQuantity, UnitPrice)
    VALUES 
        (inOrderID, inProductID1, inQuantity1, inUnitPrice1),
        (inOrderID, inProductID2, inQuantity2, inUnitPrice2);

    UPDATE Orders
    SET OrderTotalAmount = (
        SELECT SUM(PurchaseQuantity * UnitPrice)
        FROM OrderItems
        WHERE OrderID = inOrderID
    )
    WHERE OrderID = inOrderID;
END;





DROP TRIGGER IF EXISTS ReduceStock;

CREATE TRIGGER ReduceStock AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products
    SET StockQuantity = StockQuantity - NEW.PurchaseQuantity
    WHERE ProductID = NEW.ProductID;
END;
