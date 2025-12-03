-- 6. Bills (For "In-App Billing")
CREATE TABLE bills (
    bill_id SERIAL PRIMARY KEY,
    contract_id INT REFERENCES contracts(contract_id),
    bill_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    rent_amount NUMERIC(10, 2) NOT NULL,
    utility_amount NUMERIC(10, 2) DEFAULT 0.00,
    total_amount NUMERIC(10, 2) GENERATED ALWAYS AS (rent_amount + utility_amount) STORED,
    status bill_status_type DEFAULT 'unpaid'
);
