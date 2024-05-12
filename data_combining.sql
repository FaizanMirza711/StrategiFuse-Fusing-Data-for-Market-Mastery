use segmentiq;
show Create table purchase_history;
select * from purchase_history;
show Create table website_browsing_behavior;
select * from website_browsing_behavior;
show Create table marketing_campaigns;
select * from marketing_campaigns;
show Create table customer_data;
select * from customer_data;
-- Join customers with purchase_history
SELECT *
FROM customer_data c
LEFT JOIN purchase_history ph ON c.CustomerID = ph.CustomerID;

-- Join customers with website_browsing_behavior
SELECT *
FROM customer_data c
LEFT JOIN website_browsing_behavior wb ON c.CustomerID = wb.CustomerID;

-- Join customers with marketing_campaigns
SELECT *
FROM customer_data c
LEFT JOIN marketing_campaigns mc ON c.CustomerID = mc.CustomerID;

-- ************************************Combined*************************************

CREATE TABLE combined_data AS
SELECT 
    c.CustomerID AS CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.PhoneNumber,
    c.Address,
    c.City,
    c.State,
    c.ZipCode,
    c.Country,
    c.Age,
    c.Gender,
    ph.Product,
    ph.Price,
    ph.Quantity,
    ph.PurchaseDate,
    wb.PageVisited,
    wb.VisitDate,
    mc.Campaign,
    mc.InteractionDate,
    mc.Outcome
FROM customer_data c
LEFT JOIN purchase_history ph ON c.CustomerID = ph.CustomerID
LEFT JOIN website_browsing_behavior wb ON c.CustomerID = wb.CustomerID
LEFT JOIN marketing_campaigns mc ON c.CustomerID = mc.CustomerID;

select * from combined_data;
desc combined_data;

