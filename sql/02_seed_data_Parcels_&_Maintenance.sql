-- 7. Insert Parcels & Maintenance
INSERT INTO parcels (recipient_user_id, tracking_number, carrier_name, arrived_at, pickup_status) VALUES
(2, 'TH-KERRY-888', 'Kerry Express', '2025-11-20', 'pending'),
(2, 'TH-LAZ-999',   'Lazada Express', '2025-11-21', 'pending'),
(3, 'TH-FLASH-777', 'Flash Express', '2025-11-15', 'collected'),
(4, 'TH-POST-111',  'ThaiPost EMS', '2025-11-22', 'pending'),
(5, 'TH-DHL-222',   'DHL Thailand', '2025-11-10', 'collected'),
(6, 'TH-KERRY-555', 'Kerry Express', '2025-11-23', 'pending'),
(7, 'TH-J&T-333',   'J&T Express', '2025-11-12', 'collected'),
(8, 'TH-NINJA-444', 'Ninja Van', '2025-11-24', 'pending'),
(9, 'TH-SHOPEE-001','Shopee Xpress', '2025-11-14', 'collected'),
(10,'TH-POST-002',  'ThaiPost Reg', '2025-11-25', 'pending'),
(12,'TH-DHL-999',   'DHL Thailand', '2025-11-25', 'pending'),
(13,'TH-KERRY-123', 'Kerry Express', '2025-11-18', 'collected');

INSERT INTO maintenance_requests (user_id, category, description, status) VALUES
(2, 'Plumbing', 'Leaking sink in bathroom', 'pending'),
(3, 'Electric', 'Light bulb broken', 'completed'),
(4, 'Furniture', 'Fixed wobbly chair leg', 'completed'),
(5, 'AC', 'Air conditioner not cooling enough', 'in_progress'),
(6, 'Internet', 'Upgraded Wifi router for Room 201', 'completed'),
(7, 'Plumbing', 'Toilet flush handle loose', 'pending'),
(8, 'General', 'Replaced battery in key card lock', 'completed'),
(9, 'Electric', 'Power outlet sparking slightly', 'pending'),
(10, 'Furniture', 'Desk drawer stuck', 'in_progress'),
(12, 'AC', 'Cleaned AC filters', 'completed');
