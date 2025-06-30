Normalization Summary
🎯 Purpose
Ensure the Airbnb database design meets Third Normal Form (3NF) standards by eliminating redundancy and reinforcing data integrity.

📶 Normalization Phases
Step 1: First Normal Form (1NF)
- Objective: Remove repeating values and ensure all fields are atomic. Assign a primary key to each table.
- Outcome:
All core tables—such as User, Property, Booking, etc.—use atomic fields and have clearly defined primary keys, satisfying 1NF.
Step 2: Second Normal Form (2NF)
- Objective: Eradicate partial dependencies by ensuring non-key attributes rely entirely on the primary key.
- Outcome:
Since all tables utilize single-column primary keys, partial dependencies are eliminated and the schema satisfies 2NF.
Step 3: Third Normal Form (3NF)
- Objective: Remove transitive dependencies, ensuring each non-key attribute depends only on the primary key.
- Analysis:
- User: All fields depend directly on user_id.
- Property: host_id is a proper foreign key, no transitive dependencies exist.
- Booking, Payment, Review, Message: All attributes are directly tied to their respective primary keys.
- Outcome:
No transitive dependencies remain; the schema fully conforms to 3NF.

🧩 Conclusion
The database design has been normalized to Third Normal Form, resulting in:
- Reduced data duplication
- Stronger data integrity
- Better performance and query efficiency

If you want, I can format this into an actual NORMALIZATION.md file or drop it into your README. Want to do that next?
