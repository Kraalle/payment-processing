CREATE TABLE payments (
    id UUID PRIMARY KEY,
    idempotency_key VARCHAR(64) UNIQUE NOT NULL,
    amount_minor BIGINT NOT NULL CHECK (amount_minor > 0),
    currency CHAR(3) NOT NULL CHECK (currency = upper(currency)),
    status VARCHAR(32) NOT NULL CHECK (status IN ('PENDING','AUTHORIZED','CAPTURED','FAILED','CANCELED')),
    created_at TIMESTAMPTZ DEFAULT now() NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL
);

CREATE INDEX idx_payments_created_at ON payments (created_at DESC);
CREATE INDEX idx_payments_status ON payments (status);
