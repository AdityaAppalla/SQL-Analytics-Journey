🚀 Project 1: Basic E-Commerce Analysis ( JoJo X Pokemon )

🚀 Objective:
This project establishes my understanding of Relational Database Management Systems (RDBMS). 
I designed a four-table schema to track customers, products, and orders while handling real-world database evolution scenarios.

🚀 What I Actually Did ?
-> **Designed the Schema:** Built a 4-table relational database with proper Primary/Foreign key logic.
-> **Handled Changes:** Used `ALTER` to fix column lengths mid-project—simulating what happens when requirements change in the real world.
-> **Complex Queries:** Moved beyond `SELECT *` to use:
    * **Multi-table Joins** to link customers to their orders.
    * **Window Functions (`ROW_NUMBER`)** to rank top purchases.
    * **Aggregations** to find which products actually make money.

🚀 File Structure
1. `01_setup_schema.sql`: Table creation, constraints, and DDL modifications.
2. `02_data_seeding.sql`: Populating the database with fictional test data (JoJo's Bizarre Adventure & Pokémon theme).
3. `03_analytical_queries.sql`: Practical business queries focused on revenue, spender habits, and inventory.

🚀 Key Takeaway
This project served as my introduction to SQL logic. I learned how to handle schema changes after a database is already live and how to join multiple datasets to derive business value.

🚀 Next Steps
This project focused on **structure**. The next project will focus on **performance**, using CTEs and larger datasets to explore scalability and query optimization.
