-- Users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(64) NOT NULL
);

-- Venues
CREATE TABLE venues (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    contact_info VARCHAR(255)
);

-- Bookings
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    venue_id INTEGER REFERENCES venues(id),
    datetime TIMESTAMP NOT NULL,
    status VARCHAR(64),
    notes TEXT
);

-- Messages
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES bookings(id),
    sender_id INTEGER REFERENCES users(id),
    content TEXT,
    timestamp TIMESTAMP DEFAULT now()
);

-- Invoices
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES bookings(id),
    client_id INTEGER REFERENCES users(id),
    amount DECIMAL(10,2),
    status VARCHAR(64)
);

-- Events
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    venue_id INTEGER REFERENCES venues(id),
    datetime TIMESTAMP,
    details TEXT
);
