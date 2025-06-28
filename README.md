# Zepto_DataAnalysis_SQL
Sure! Here's a **simplified version** of your `README.md`:

---

# 🛒 Zepto SQL Data Analysis

## 📄 About

This project is a basic SQL analysis of Zepto product data. It includes:

* Data cleaning
* Data exploration
* Business insights using SQL queries

---

## 💾 Tools Used

* SQL (PostgreSQL or any SQL client)

---

## 🧱 Table Info

**Table Name:** `zepto`

**Main Columns:**

* `sku_id` – Product ID
* `category` – Product category
* `name` – Product name
* `mrp` – Product price (MRP)
* `discountPercent` – Discount in %
* `availableQuantity` – Quantity in stock
* `discountSellingPrice` – Selling price after discount
* `weightIngms` – Weight in grams
* `outOfStock` – In stock or not
* `quantity` – Number of units

---

## 🔍 What I Did

### ✅ Data Cleaning

* Removed rows with 0 price
* Converted prices from paise to rupees
* Checked for null or missing values

### 📊 Data Analysis

* Top 10 products with the highest discounts
* Expensive products that are out of stock
* Revenue per category
* Best price per gram
* Categories with highest average discount
* Inventory weight per category
* Grouped products by weight (Low, Medium, Bulk)

---

## 📌 How to Use

1. Create the table using the SQL script.
2. Insert the data.
3. Run the queries one by one to explore and analyze.

---

Let me know if you want this saved as a `.md` file!
