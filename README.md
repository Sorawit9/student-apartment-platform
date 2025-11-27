# Student Apartment Rental Platform 🏢

**Course:** Database Foundations Term Project
**Date:** November 2025

## 📖 Project Scope
This platform addresses the specific needs of university students ("Digital Natives") living in dormitories. It modernizes the rental experience by replacing outdated paper processes with a streamlined app.

### 🎯 Target Audience
* **Users:** University Students (Gen Z) with limited budgets but high lifestyle expectations.
* **Pain Points Solved:**
    1.  **"Random Roommate" Roulette:** Fear of incompatible roommates.
    2.  **"Paperwork" Friction:** Dislike of cash payments and physical forms.
    3.  **"Safety & Privacy" Anxiety:** Fear of lost parcels or intruders.

## 🛠 Tech Stack
* **Database:** PostgreSQL (Hosted on Render.com)
* **Logic:** PL/PGSQL Stored Functions
* **Tools:** DBeaver / pgAdmin

## ✨ Key Features & Functions

### 1. Roommate Compatibility Algorithm 🤝
* **Problem:** Students move out due to lifestyle conflicts (noise, AC temp, sleep schedule).
* **Solution:** An algorithm matches students based on sleep data, smoking habits, and personality.
* **Function:** `fn_find_compatible_roommates(current_user_id)`
    * *Input:* User ID
    * *Output:* List of compatible students with a "Compatibility Score" (0-100).

### 2. In-App Billing Dashboard 💸
* **Problem:** Physical bills and cash payments are inconvenient.
* **Solution:** Automated calculation of Rent + Water + Electricity.
* **Function:** `fn_calculate_monthly_bill(contract_id, month, year)`
    * *Logic:* Sums base rent and utility usage. Updates `bills` table status.

### 3. Digital Parcel Log 📦
* **Problem:** Anxiety over lost packages.
* **Solution:** Real-time log of received parcels.
* **Function:** `fn_check_incoming_parcels(user_id)`
    * *Output:* Returns a secure list of uncollected parcels for the logged-in student.

## 🗄️ Database Schema
The database is normalized to 3NF to ensure data integrity.
* `users`: Stores authentication and role data.
* `student_profiles`: Stores matching criteria (Sleep time, Zodiac, etc.).
* `rooms` & `contracts`: Manages occupancy and leases.
* `bills`: Handles financial transactions.

## 🚀 How to Deploy
1.  Create a PostgreSQL database on [Render.com](https://render.com).
2.  Run the scripts in the `/sql` folder in this order:
    * `01_schema.sql`
    * `02_seed_data.sql`
    * `03_functions.sql`
