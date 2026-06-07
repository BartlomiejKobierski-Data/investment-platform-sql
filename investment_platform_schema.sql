-- ============================================
-- Investment Platform Database
-- Portfolio Project | Data Analyst
-- ============================================

-- 1. STOCKS
CREATE TABLE stocks (
    stock_id SERIAL PRIMARY KEY,
    ticker VARCHAR(10) NOT NULL UNIQUE,
    company_name VARCHAR(100) NOT NULL,
    sector VARCHAR(50),
    exchange VARCHAR(20) -- GPW, NYSE, NASDAQ
);

INSERT INTO stocks (ticker, company_name, sector, exchange) VALUES
('PKO', 'PKO Bank Polski', 'Banking', 'GPW'),
('PEO', 'Bank Pekao', 'Banking', 'GPW'),
('CDR', 'CD Projekt', 'Technology', 'GPW'),
('DNP', 'Dino Polska', 'Retail', 'GPW'),
('KGH', 'KGHM Polska Miedź', 'Mining', 'GPW'),
('ALE', 'Allegro.eu', 'E-commerce', 'GPW'),
('LPP', 'LPP SA', 'Retail', 'GPW'),
('PZU', 'PZU SA', 'Insurance', 'GPW'),
('AAPL', 'Apple Inc.', 'Technology', 'NASDAQ'),
('MSFT', 'Microsoft Corp.', 'Technology', 'NASDAQ');


-- 2. STOCK PRICES (last 6 months, simplified)
CREATE TABLE stock_prices (
    price_id SERIAL PRIMARY KEY,
    stock_id INT REFERENCES stocks(stock_id),
    price_date DATE NOT NULL,
    open_price NUMERIC(10,2),
    high_price NUMERIC(10,2),
    low_price NUMERIC(10,2),
    close_price NUMERIC(10,2),
    volume BIGINT
);

INSERT INTO stock_prices (stock_id, price_date, open_price, high_price, low_price, close_price, volume) VALUES
-- PKO
(1, '2025-12-01', 48.50, 49.20, 48.10, 48.90, 1200000),
(1, '2026-01-01', 48.90, 50.10, 48.50, 49.80, 1350000),
(1, '2026-02-01', 49.80, 51.00, 49.20, 50.50, 1100000),
(1, '2026-03-01', 50.50, 52.30, 50.00, 51.80, 1450000),
(1, '2026-04-01', 51.80, 53.00, 51.20, 52.40, 1300000),
(1, '2026-05-01', 52.40, 54.10, 52.00, 53.70, 1500000),
-- PEO
(2, '2025-12-01', 135.00, 137.50, 134.00, 136.20, 450000),
(2, '2026-01-01', 136.20, 139.00, 135.50, 138.00, 500000),
(2, '2026-02-01', 138.00, 141.00, 137.00, 140.50, 420000),
(2, '2026-03-01', 140.50, 143.00, 139.80, 142.30, 480000),
(2, '2026-04-01', 142.30, 145.00, 141.50, 144.10, 510000),
(2, '2026-05-01', 144.10, 147.00, 143.50, 146.20, 530000),
-- CDR
(3, '2025-12-01', 142.00, 145.00, 140.50, 143.80, 800000),
(3, '2026-01-01', 143.80, 148.00, 142.00, 146.50, 850000),
(3, '2026-02-01', 146.50, 150.00, 145.00, 148.90, 780000),
(3, '2026-03-01', 148.90, 152.00, 147.50, 150.30, 900000),
(3, '2026-04-01', 150.30, 153.00, 148.80, 151.70, 820000),
(3, '2026-05-01', 151.70, 155.00, 150.50, 153.40, 870000),
-- KGH
(5, '2025-12-01', 98.00, 100.50, 97.20, 99.40, 600000),
(5, '2026-01-01', 99.40, 102.00, 98.50, 101.20, 650000),
(5, '2026-02-01', 101.20, 104.00, 100.50, 103.10, 580000),
(5, '2026-03-01', 103.10, 105.50, 102.00, 104.80, 620000),
(5, '2026-04-01', 104.80, 107.00, 103.50, 106.20, 670000),
(5, '2026-05-01', 106.20, 109.00, 105.50, 108.10, 700000),
-- AAPL
(9, '2025-12-01', 220.00, 225.00, 218.50, 223.40, 5000000),
(9, '2026-01-01', 223.40, 228.00, 221.00, 226.80, 5200000),
(9, '2026-02-01', 226.80, 231.00, 225.00, 229.50, 4800000),
(9, '2026-03-01', 229.50, 234.00, 228.00, 232.10, 5100000),
(9, '2026-04-01', 232.10, 237.00, 230.50, 235.40, 5300000),
(9, '2026-05-01', 235.40, 240.00, 234.00, 238.90, 5500000);


-- 3. CLIENTS
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    registration_date DATE,
    segment VARCHAR(20) CHECK (segment IN ('Standard', 'Premium', 'VIP'))
);

INSERT INTO clients (first_name, last_name, country, registration_date, segment) VALUES
('Marek', 'Kowalski', 'Poland', '2022-03-15', 'VIP'),
('Anna', 'Nowak', 'Poland', '2023-01-10', 'Premium'),
('Piotr', 'Wiśniewski', 'Poland', '2021-07-22', 'VIP'),
('Katarzyna', 'Wójcik', 'Poland', '2023-06-05', 'Standard'),
('Tomasz', 'Kowalczyk', 'Poland', '2022-11-30', 'Premium'),
('Magdalena', 'Kamińska', 'Poland', '2024-02-14', 'Standard'),
('Krzysztof', 'Lewandowski', 'Poland', '2021-09-08', 'VIP'),
('Agnieszka', 'Zielińska', 'Poland', '2023-08-19', 'Premium');


-- 4. PORTFOLIOS
CREATE TABLE portfolios (
    portfolio_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id),
    portfolio_name VARCHAR(100),
    created_date DATE,
    currency VARCHAR(10) DEFAULT 'PLN'
);

INSERT INTO portfolios (client_id, portfolio_name, created_date, currency) VALUES
(1, 'Portfel GPW Główny', '2022-03-20', 'PLN'),
(1, 'Portfel Zagraniczny', '2022-06-15', 'PLN'),
(2, 'Portfel Dywidendowy', '2023-01-15', 'PLN'),
(3, 'Portfel Agresywny', '2021-08-01', 'PLN'),
(4, 'Portfel Konserwatywny', '2023-06-10', 'PLN'),
(5, 'Portfel Mieszany', '2022-12-05', 'PLN'),
(6, 'Portfel Startowy', '2024-02-20', 'PLN'),
(7, 'Portfel Blue Chip', '2021-09-15', 'PLN');


-- 5. TRANSACTIONS
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    portfolio_id INT REFERENCES portfolios(portfolio_id),
    stock_id INT REFERENCES stocks(stock_id),
    transaction_type VARCHAR(4) CHECK (transaction_type IN ('BUY', 'SELL')),
    quantity INT,
    price_per_share NUMERIC(10,2),
    transaction_date DATE,
    total_value NUMERIC(12,2) GENERATED ALWAYS AS (quantity * price_per_share) STORED
);

INSERT INTO transactions (portfolio_id, stock_id, transaction_type, quantity, price_per_share, transaction_date) VALUES
-- Portfel 1 (Marek - GPW)
(1, 1, 'BUY', 500, 48.50, '2025-12-05'),
(1, 2, 'BUY', 100, 135.00, '2025-12-10'),
(1, 3, 'BUY', 200, 142.00, '2026-01-08'),
(1, 1, 'SELL', 200, 51.80, '2026-03-15'),
(1, 3, 'SELL', 100, 150.30, '2026-04-10'),
-- Portfel 2 (Marek - Zagraniczny)
(2, 9, 'BUY', 50, 220.00, '2025-12-05'),
(2, 9, 'BUY', 30, 226.80, '2026-02-10'),
(2, 9, 'SELL', 20, 235.40, '2026-05-05'),
-- Portfel 3 (Anna - Dywidendowy)
(3, 1, 'BUY', 300, 49.80, '2026-01-15'),
(3, 2, 'BUY', 150, 138.00, '2026-01-20'),
(3, 8, 'BUY', 200, 35.00, '2026-02-01'),
-- Portfel 4 (Piotr - Agresywny)
(4, 3, 'BUY', 400, 142.00, '2021-08-05'),
(4, 5, 'BUY', 300, 98.00, '2025-12-10'),
(4, 3, 'SELL', 200, 153.40, '2026-05-10'),
(4, 5, 'SELL', 100, 108.10, '2026-05-15'),
-- Portfel 5 (Katarzyna - Konserwatywny)
(5, 1, 'BUY', 100, 50.50, '2026-02-05'),
(5, 2, 'BUY', 50, 140.50, '2026-02-10'),
-- Portfel 6 (Tomasz - Mieszany)
(6, 1, 'BUY', 200, 48.90, '2026-01-05'),
(6, 9, 'BUY', 25, 223.40, '2026-01-10'),
(6, 5, 'BUY', 150, 101.20, '2026-02-05'),
-- Portfel 7 (Magdalena - Startowy)
(7, 1, 'BUY', 50, 52.40, '2026-04-01'),
(7, 3, 'BUY', 30, 151.70, '2026-05-01'),
-- Portfel 8 (Krzysztof - Blue Chip)
(8, 1, 'BUY', 800, 48.50, '2021-09-20'),
(8, 2, 'BUY', 400, 135.00, '2021-09-20'),
(8, 9, 'BUY', 100, 220.00, '2025-12-15'),
(8, 1, 'SELL', 300, 53.70, '2026-05-10');


-- ============================================
-- ANALYTICAL QUERIES
-- ============================================

-- 1. Łączna wartość transakcji BUY per klient
SELECT
    c.first_name || ' ' || c.last_name AS client,
    c.segment,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.total_value) AS total_invested
FROM clients c
JOIN portfolios p ON c.client_id = p.client_id
JOIN transactions t ON p.portfolio_id = t.portfolio_id
WHERE t.transaction_type = 'BUY'
GROUP BY c.client_id, c.first_name, c.last_name, c.segment
ORDER BY total_invested DESC;


-- 2. ROI per transakcja SELL (zysk vs średnia cena zakupu)
WITH buy_avg AS (
    SELECT
        portfolio_id,
        stock_id,
        AVG(price_per_share) AS avg_buy_price
    FROM transactions
    WHERE transaction_type = 'BUY'
    GROUP BY portfolio_id, stock_id
)
SELECT
    c.first_name || ' ' || c.last_name AS client,
    s.ticker,
    t.quantity,
    t.price_per_share AS sell_price,
    b.avg_buy_price,
    ROUND((t.price_per_share - b.avg_buy_price) / b.avg_buy_price * 100, 2) AS roi_pct,
    ROUND((t.price_per_share - b.avg_buy_price) * t.quantity, 2) AS profit_pln
FROM transactions t
JOIN buy_avg b ON t.portfolio_id = b.portfolio_id AND t.stock_id = b.stock_id
JOIN portfolios p ON t.portfolio_id = p.portfolio_id
JOIN clients c ON p.client_id = c.client_id
JOIN stocks s ON t.stock_id = s.stock_id
WHERE t.transaction_type = 'SELL'
ORDER BY profit_pln DESC;


-- 3. Ranking klientów po zysku (window function)
WITH client_pnl AS (
    SELECT
        c.client_id,
        c.first_name || ' ' || c.last_name AS client,
        c.segment,
        SUM(CASE WHEN t.transaction_type = 'SELL' THEN t.total_value ELSE -t.total_value END) AS net_pnl
    FROM clients c
    JOIN portfolios p ON c.client_id = p.client_id
    JOIN transactions t ON p.portfolio_id = t.portfolio_id
    GROUP BY c.client_id, c.first_name, c.last_name, c.segment
)
SELECT
    client,
    segment,
    net_pnl,
    RANK() OVER (ORDER BY net_pnl DESC) AS rank_overall,
    RANK() OVER (PARTITION BY segment ORDER BY net_pnl DESC) AS rank_in_segment
FROM client_pnl
ORDER BY rank_overall;


-- 4. Miesięczny wolumen transakcji per sektor
SELECT
    TO_CHAR(t.transaction_date, 'YYYY-MM') AS month,
    s.sector,
    COUNT(t.transaction_id) AS num_transactions,
    SUM(t.total_value) AS total_volume,
    SUM(SUM(t.total_value)) OVER (PARTITION BY s.sector ORDER BY TO_CHAR(t.transaction_date, 'YYYY-MM')) AS cumulative_volume
FROM transactions t
JOIN stocks s ON t.stock_id = s.stock_id
GROUP BY TO_CHAR(t.transaction_date, 'YYYY-MM'), s.sector
ORDER BY month, total_volume DESC;


-- 5. Najlepsze spółki wg wzrostu ceny (6 miesięcy)
WITH price_range AS (
    SELECT
        stock_id,
        MIN(price_date) AS first_date,
        MAX(price_date) AS last_date
    FROM stock_prices
    GROUP BY stock_id
),
price_change AS (
    SELECT
        p.stock_id,
        sp_first.close_price AS price_start,
        sp_last.close_price AS price_end
    FROM price_range p
    JOIN stock_prices sp_first ON p.stock_id = sp_first.stock_id AND p.first_date = sp_first.price_date
    JOIN stock_prices sp_last ON p.stock_id = sp_last.stock_id AND p.last_date = sp_last.price_date
)
SELECT
    s.ticker,
    s.company_name,
    s.sector,
    pc.price_start,
    pc.price_end,
    ROUND((pc.price_end - pc.price_start) / pc.price_start * 100, 2) AS growth_pct
FROM price_change pc
JOIN stocks s ON pc.stock_id = s.stock_id
ORDER BY growth_pct DESC;


-- 6. Aktywność klientów - ile dni od ostatniej transakcji
SELECT
    c.first_name || ' ' || c.last_name AS client,
    c.segment,
    MAX(t.transaction_date) AS last_transaction,
    CURRENT_DATE - MAX(t.transaction_date) AS days_since_last_transaction
FROM clients c
JOIN portfolios p ON c.client_id = p.client_id
JOIN transactions t ON p.portfolio_id = t.portfolio_id
GROUP BY c.client_id, c.first_name, c.last_name, c.segment
ORDER BY days_since_last_transaction;
