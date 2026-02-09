# Module 2: Development Environments (Docker & SQL)

This module focuses on setting up a professional development environment using Docker and learning SQL fundamentals.

## Getting Started with Docker & PostgreSQL

1. **Prerequisites**: Ensure you have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.

2. **Spin up the Database**: 
   From this directory (`01-Foundations/docker_sql`), run:
   ```bash
   docker-compose up -d
   ```
   *The `-d` flag runs the container in detached mode (background).*

3. **Check the version**:
   ```bash
   docker exec -it de_postgres_lab psql -U de_user -d warehouse -c "SELECT version();"
   ```

4. **Run the Initialization Script**:
   To create the tables and load sample data, run:
   ```bash
   docker exec -i de_postgres_lab psql -U de_user -d warehouse < init_db.sql
   ```

5. **Interact with the DB**:
   ```bash
   docker exec -it de_postgres_lab psql -U de_user -d warehouse
   ```

## Next Steps: SQL Exercises
Once the database is up, we will perform exercises on:
- Joins (Connecting products and categories)
- Aggregations (Total sales per product)
- Window Functions (Ranking products by price)
