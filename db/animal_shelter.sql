DROP TABLE type CASCADE;
DROP TABLE animals CASCADE;
DROP TABLE owners CASCADE;
DROP TABLE  adoptions CASCADE;

CREATE TABLE type(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE animals(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type int8 REFERENCES type(id) ON DELETE CASCADE, 
  breed VARCHAR(255) NOT NULL,
  admission_date DATE,
  status BOOLEAN,
  description TEXT,
  image VARCHAR(255),
  training BOOLEAN
  
);

CREATE TABLE owners(
 id SERIAL8 PRIMARY KEY,
 first_name VARCHAR(255),
 last_name VARCHAR(255),
 email VARCHAR(255)
 );
 
CREATE TABLE adoptions(
 id SERIAL8 PRIMARY KEY,
 owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE,
 animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE

);
 



