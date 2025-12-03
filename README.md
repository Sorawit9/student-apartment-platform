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
        string role
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
    }

    CONTRACTS {
        int contract_id PK
        int user_id FK
        int room_id FK
    }

    BILLS {
        int bill_id PK
        int contract_id FK
        decimal total_amount
        string status
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
