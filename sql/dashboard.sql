CREATE DATABASE IF NOT EXISTS dashboard_finance CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE dashboard_finance;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    niveau ENUM('Silver', 'Gold', 'GoldPlus') NOT NULL DEFAULT 'Silver',
    code_verification VARCHAR(6) DEFAULT NULL,
    code_expire DATETIME DEFAULT NULL,
    actif TINYINT(1) DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE finances(
    id INT AUTO_INCREMENT PRIMATY KEY,
    user_id INT NOT NULL,
    type ENUM ('gain', 'perte') NOT NULL,
    montant DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255) DEFAULT NULL,
    date_transaction DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO users (nom, email, password, niveau, actif) VALUES ('Administrateur', 'admin@dashboard.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'GoldPlus', 1);