DROP TABLE owners;
DROP TABLE animals;


CREATE TABLE animals(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  breed VARCHAR(255) NOT NULL,
  admission_date DATE,
  status BOOLEAN,
  description TEXT,
  image VARCHAR(255)
  
);

CREATE TABLE owners(
 id SERIAL8 PRIMARY KEY,
 first_name VARCHAR(255),
 last_name VARCHAR(255),
 email VARCHAR(255),
 
 animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE

);
 



