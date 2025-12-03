# Student Apartment Rental Platform 🏢

**Course:** Database Systems Term Project
**Date:** November 2025

## 📖 Project Scope
This platform addresses the specific needs of university students ("Digital Natives") living in dormitories. It modernizes the rental experience by replacing outdated paper processes with a streamlined app.

### 🎯 Target Audience
* **Users:** University Students (Gen Z) with limited budgets but high lifestyle expectations.
* **Pain Points Solved:**
    1.  **"Random Roommate" Roulette:** Fear of incompatible roommates.
    2.  **"Paperwork" Friction:** Dislike of cash payments and physical forms.
    3.  **"Safety & Privacy" Anxiety:** Fear of lost parcels or intruders.
    4.  **Slow Maintenance:** Frustration with verbal repair requests being ignored.

## 🛠 Tech Stack
* **Database:** PostgreSQL 16 (Hosted on Render.com)
* **Backend Logic:** PL/PGSQL Stored Functions
* **Tools:** VS Code (Database Client), DBeaver, dbdiagram.io

---

## ✨ Key Features & SQL Functions

### 1. Roommate Compatibility Algorithm 🤝
* **Problem:** Students move out due to lifestyle conflicts (noise, sleep schedules).
* **Solution:** An algorithm matches students based on strict **Gender** and **Smoking** rules, then scores them based on **Sleep Schedule** alignment.
* **Function:** `fn_find_compatible_roommates(p_user_id)`

### 2. In-App Billing Dashboard 💸
* **Problem:** Physical bills are easily lost; cash payments are inconvenient.
* **Solution:** Automated calculation of Rent + Water + Electricity. Shows "Unpaid" or "Overdue" status instantly.
* **Function:** `fn_get_my_bills(p_user_id)`

### 3. Digital Parcel Log 📦
* **Problem:** Anxiety over lost packages at the front desk.
* **Solution:** Real-time log of received parcels. Students see a notification only when a package arrives for *them*.
* **Function:** `fn_check_incoming_parcels(p_user_id)`

### 4. Maintenance Ticketing System 🔧
* **Problem:** Repair requests get lost or forgotten.
* **Solution:** Digital submission form that inserts a request directly into the database with a timestamp.
* **Function:** `fn_submit_maintenance_request(p_user_id, p_category, p_description)`
* *Note: This performs a WRITE operation (INSERT).*

---

## 🗄️ Database Schema (ER Diagram)

The database is normalized to 3NF. It separates user credentials from profile data to improve performance and data integrity.

```mermaid
erDiagram
    USERS ||--|| STUDENT_PROFILES : "has details"
    USERS ||--o{ CONTRACTS : "signs"
    USERS ||--o{ PARCELS : "receives"
    USERS ||--o{ MAINTENANCE_REQUESTS : "submits"
    ROOMS ||--o{ CONTRACTS : "is rented via"
    CONTRACTS ||--o{ BILLS : "generates"

    USERS {
        int user_id PK
        string username
        string role "admin/student"
    }

    STUDENT_PROFILES {
        int profile_id PK
        int user_id FK
        string phone_number
        string gender
        int sleep_time
        boolean is_smoker
    }

    ROOMS {
        int room_id PK
        string room_number
        decimal monthly_rent
        string status
    }

    CONTRACTS {
        int contract_id PK
        int user_id FK
        int room_id FK
        date start_date
        date end_date
    }

    BILLS {
        int bill_id PK
        int contract_id FK
        decimal total_amount
        string status "paid/unpaid"
    }

    PARCELS {
        int parcel_id PK
        int recipient_user_id FK
        string tracking_number
        string pickup_status
    }
    
    MAINTENANCE_REQUESTS {
        int request_id PK
        int user_id FK
        string category
        string status
    }
