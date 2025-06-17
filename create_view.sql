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