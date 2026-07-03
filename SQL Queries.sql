-- Total Customers
SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM customer;

-- Total Sales
SELECT
    SUM(BillAmount) AS TotalSales
FROM sales;

-- Collected Amount
SELECT
    SUM(AmountPaid) AS TotalPaymentReceived
FROM payment_transaction;

-- Pending Amount
SELECT
(
    SELECT SUM(BillAmount)
    FROM sales
)
-
(
    SELECT SUM(AmountPaid)
    FROM payment_transaction
)
AS PendingAmount;

-- Collection Efficiency %
SELECT
ROUND(
    SUM(AmountPaid) * 100.0 /
    (SELECT SUM(BillAmount) FROM sales)
,2) AS CollectionEfficiency
FROM payment_transaction;

-- Average Bill Value
SELECT
ROUND(
    SUM(BillAmount) * 1.0 /
    COUNT(InvoiceID)
,2) AS AvgBillValue
FROM sales;

-- Total Cities
SELECT
COUNT(DISTINCT City) AS TotalCities
FROM customer;