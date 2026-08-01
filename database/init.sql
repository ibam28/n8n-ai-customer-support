-- =====================================================
-- AI Customer Support Database
-- Version : 1.0.0
-- Database: MySQL 8.4
-- Engine  : InnoDB
-- Charset : utf8mb4
-- =====================================================

-- =====================================================
-- Customers
-- Stores customer profile information
-- =====================================================

CREATE TABLE customers (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    status VARCHAR(20) NOT NULL DEFAULT 'active',

    name VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    phone VARCHAR(30) NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_customer_email
        UNIQUE (email),

    CONSTRAINT uq_customer_phone
        UNIQUE (phone)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Conversations
-- Stores chat sessions
-- =====================================================

CREATE TABLE conversations (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    customer_id BIGINT UNSIGNED NOT NULL,

    channel VARCHAR(50) NOT NULL,
    external_id VARCHAR(255) NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'open',

    started_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    closed_at TIMESTAMP NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_conversation_channel_external
        UNIQUE (channel, external_id),

    CONSTRAINT fk_conversation_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Messages
-- Stores all chat messages
-- =====================================================

CREATE TABLE messages (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    conversation_id BIGINT UNSIGNED NOT NULL,

    role VARCHAR(20) NOT NULL,
    message_type VARCHAR(30) NOT NULL DEFAULT 'text',

    message TEXT NOT NULL,
    attachment_url TEXT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_message_conversation
        FOREIGN KEY (conversation_id)
        REFERENCES conversations(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- AI Logs
-- Stores AI processing logs
-- =====================================================

CREATE TABLE ai_logs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    message_id BIGINT UNSIGNED NOT NULL,

    model VARCHAR(100) NOT NULL,

    prompt LONGTEXT NOT NULL,
    response LONGTEXT NOT NULL,

    latency_ms INT UNSIGNED NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'success',
    error_message TEXT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ai_log_message
        FOREIGN KEY (message_id)
        REFERENCES messages(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- Indexes
-- =====================================================

CREATE INDEX idx_conversations_customer_id
    ON conversations(customer_id);

CREATE INDEX idx_messages_conversation_id
    ON messages(conversation_id);

CREATE INDEX idx_ai_logs_message_id
    ON ai_logs(message_id);
