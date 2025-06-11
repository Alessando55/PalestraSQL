# PalestraSQLThis project focuses on the design, implementation, and population of a relational database for managing a gym and its associated services. Developed using SQL and a relational database management system (RDBMS), the project provides a comprehensive data model that supports key operations including:

- Member management, including athletes, their personal profiles, training programs, and nutrition plans.

- Staff organization, such as managing trainers and secretaries, and linking them to specific events.

- Service scheduling, which incorporates wellness centers, dance schools, treatments, and gym workouts.

- Event tracking and analytics, allowing secretaries to be linked with events, and generating reports using SQL queries and views.

The logical model includes multiple interrelated entities (e.g., ATLETA_T, ALLENATORE_T, EVENTO_T, SERVIZIO_T) and uses foreign keys to maintain referential integrity. The schema supports advanced queries such as aggregation, filtering by specialization, view creation for reporting, and data manipulation through INSERT, UPDATE, and DELETE operations.

Data population was carried out using a combination of manually inserted entries and randomly generated data via Mockaroo, ensuring realistic and diverse datasets.

The project has undergone several refinements based on improved understanding of relational modeling, including entity simplification and attribute optimization. The final model offers a scalable foundation for any gym-related data management solution.
