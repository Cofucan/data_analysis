Select *
From SQL_Learning..financials


--Total number of records for each year in the table
Select Year, Count(Year)
From SQL_Learning..financials
Group by Year


--Total number of records for each segment in the table
Select Segment, Count(Segment)
From SQL_Learning..financials
Group by Segment


--Total number of records for each product in the table
Select Product, Count(Product)
From SQL_Learning..financials
Group by Product


--Table ordered by month and year
Select *
From SQL_Learning..financials
Order by Year, [Month Number]


--Total sales for each product in September 2013
Select Product, Sum([Units Sold])
From SQL_Learning..financials
Where [Month Name] = 'September' and Year = 2013
Group by Product


--Sales with no discounts
Select *
From SQL_Learning..financials
Where Discounts = 0
Order by Year, [Month Number]


--Sales filtered for a specific product
Select *
From SQL_Learning..financials
Where Product = 'Paseo'
Order by [Discount Band], Year, [Month Number]


--Looking at specific columns from the table
Select [Discount Band], Discounts
From SQL_Learning..financials


--Total units sold for each discount band (during each discount level), filtered for a specific product
Select Product, [Discount Band], Sum([Units Sold]) As [Total Units]
From SQL_Learning..financials
Where Product = 'Paseo'
Group by Product, [Discount Band]



ALTER TABLE SQL_Learning..financials ADD Discount_Rank AS (QtyAvailable * UnitPrice * 1.5)


--Adding a column that will enable me rank the 'Discount Band' from 'None' to 'High'
Select *,
Case
	When [Discount Band] = 'None' Then 0
	When [Discount Band] = 'Low' Then 1
	When [Discount Band] = 'Medium' Then 2
	When [Discount Band] = 'High' Then 3
End As [Discount Rank]
From SQL_Learning..financials


--Totals sales made during each discount period, with column added to be able to properly order discount band, filtered by specific product
Select Product, [Discount Band], Sum([Units Sold]) As [Total Units]
From SQL_Learning..financials
Where Product = 'Paseo'
Group by Product, [Discount Band]
Order by 
(Case
	When [Discount Band] = 'None' Then 0
	When [Discount Band] = 'Low' Then 1
	When [Discount Band] = 'Medium' Then 2
	When [Discount Band] = 'High' Then 3
End) --As [Discount Rank])



-- Lets analyze sales of each product in each country per month
-- Lets determine how discounts affect units sold for each product per country
-- Lets determine profit margins for each product, relative to discounts
-- What is the best price for the highest profit margin


