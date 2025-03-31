SET client_min_messages TO WARNING;

CREATE TABLE IF NOT EXISTS branch (
    tenant_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id SERIAL UNIQUE,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS global_products (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category TEXT[] NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    images TEXT[] NOT NULL
);

CREATE TABLE IF NOT EXISTS branch_products (
  tenant_id UUID NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (tenant_id, product_id),
  FOREIGN KEY (tenant_id) REFERENCES branch(tenant_id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES global_products(id) ON DELETE CASCADE
);


