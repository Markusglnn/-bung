CREATE TABLE users (
    user_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    username varchar(50) NOT NULL UNIQUE,
    email varchar(100) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE roles (
    role_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    role_name VARCHAR2(50) NOT NULL UNIQUE,
    description VARCHAR2(255)
);

create table premissions (
    premission_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    premission_name VARCHAR2(50) NOT NULL UNIQUE,
    description VARCHAR2(255)
);

create table role_premissions (
    role_id NUMBER NOT NULL,
    premission_id NUMBER NOT NULL,
    PRIMARY KEY (role_id, premission_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE,
    FOREIGN KEY (premission_id) REFERENCES premissions(premission_id) ON DELETE CASCADE
);

create table user_roles (
    user_id NUMBER NOT NULL,
    role_id NUMBER NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
);

create table user_log (
    log_id NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    user_id NUMBER NOT NULL,
    action VARCHAR2(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

