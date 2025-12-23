# 🚗 Vehicle Rental System (PostgreSQL)

This project demonstrates basic and important **SQL querying concepts** using a **Vehicle Rental System** database.
The database name is:

```text
vehicle_rental_system
```

The queries below are written to practice **JOINs, EXISTS, WHERE, GROUP BY, and HAVING**.

---

## 📂 Database Tables Used

* **users** → stores customer information
* **vehicles** → stores vehicle details
* **bookings** → stores booking records

---

## 🔹 Query 1: JOIN

### ❓ Requirement

Retrieve booking information along with:

* Customer name
* Vehicle name

### 🧠 Concepts Used

`INNER JOIN`

### ✅ Query

```sql
SELECT 
    b.id AS booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings AS b
INNER JOIN users AS u 
    ON u.id = b.customer_id
INNER JOIN vehicles AS v 
    ON v.id = b.vehicle_id;
```

### 📝 Explanation

* Joins **bookings**, **users**, and **vehicles**
* Shows only bookings that have valid customers and vehicles
* `INNER JOIN` ensures matching records exist in all tables

---

## 🔹 Query 2: EXISTS

### ❓ Requirement

Find all vehicles that have **never been booked**

### 🧠 Concepts Used

`NOT EXISTS`

### ✅ Query

```sql
SELECT *
FROM vehicles AS v
WHERE NOT EXISTS (
    SELECT *
    FROM bookings AS b
    WHERE b.vehicle_id = v.id
);
```

### 📝 Explanation

* Checks each vehicle
* If no matching booking exists, the vehicle is returned
* Useful for finding **unused or never-booked vehicles**

---

## 🔹 Query 3: WHERE

### ❓ Requirement

Retrieve all **available vehicles** of a specific type (e.g., cars)

### 🧠 Concepts Used

`SELECT`, `WHERE`

### ✅ Query

```sql
SELECT *
FROM vehicles
WHERE type = 'car'
  AND status = 'available';
```

### 📝 Explanation

* Filters vehicles by **type**
* Ensures only **currently available** vehicles are shown
* Uses `AND` to apply multiple conditions

---

## 🔹 Query 4: GROUP BY and HAVING

### ❓ Requirement

Find the total number of bookings for each vehicle
Show only vehicles with **more than 2 bookings**

### 🧠 Concepts Used

`GROUP BY`, `HAVING`, `COUNT`

### ✅ Query

```sql
SELECT 
    v.name AS vehicle_name,
    COUNT(b.id) AS total_bookings
FROM bookings AS b
INNER JOIN vehicles AS v 
    ON v.id = b.vehicle_id
GROUP BY v.name
HAVING COUNT(b.id) > 2;
```

### 📝 Explanation

* Groups bookings by vehicle
* Counts how many times each vehicle was booked
* `HAVING` filters groups after counting
* Shows only vehicles with **more than 2 bookings**

---

## ✅ Key Takeaways

* `INNER JOIN` → only matching records
* `NOT EXISTS` → perfect for “never happened” queries
* `WHERE` → filters rows
* `GROUP BY` → groups data
* `HAVING` → filters grouped results

---

## 📌 Author

**Vehicle Rental System – SQL Practice Project**
Designed for learning and understanding PostgreSQL fundamentals.

---

