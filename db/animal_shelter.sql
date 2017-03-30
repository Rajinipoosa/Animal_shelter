DROP TABLE owners;
DROP TABLE animals;


CREATE TABLE animals(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  admission_date VARCHAR(255),
  status BOOLEAN,
  description TEXT,
  price INT4
);

CREATE TABLE owners(
 id SERIAL8 PRIMARY KEY,
 first_name VARCHAR(255),
 last_name VARCHAR(255),
 email VARCHAR(255),
 phone_num INT4,
 animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE

);
 



