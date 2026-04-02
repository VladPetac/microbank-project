-- MicroBank Database Initialization
-- This script runs automatically when PostgreSQL starts for the first time

-- Accounts table
CREATE TABLE IF NOT EXISTS accounts (
    id SERIAL PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    holder_name VARCHAR(100) NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0.00,
    currency VARCHAR(3) DEFAULT 'RON',
    status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    from_account VARCHAR(20),
    to_account VARCHAR(20),
    amount DECIMAL(15,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'RON',
    type VARCHAR(20) NOT NULL,
    status VARCHAR(20) DEFAULT 'COMPLETED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO accounts (account_number, holder_name, balance) VALUES
    ('RO001', 'Maria Popescu', 15000.00),
    ('RO002', 'Ion Ionescu', 8500.50),
    ('RO003', 'Ana Gheorghe', 22000.00);

INSERT INTO transactions (from_account, to_account, amount, type) VALUES
    ('RO001', 'RO002', 500.00, 'TRANSFER'),
    ('RO003', 'RO001', 1200.00, 'TRANSFER');
