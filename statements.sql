--name: create-tables
CREATE TABLE IF NOT EXISTS projects (
  id SERIAL8 NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  date DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS project_images (
  id SERIAL8 NOT NULL PRIMARY KEY,
  project_id SERIAL8 NOT NULL,
  text TEXT NOT NULL,
  image BYTEA NOT NULL,
  index SMALLINT NOT NULL
);
CREATE TABLE IF NOT EXISTS home_images (
  id SERIAL8 NOT NULL PRIMARY KEY,
  image BYTEA NOT NULL,
  index SMALLINT NOT NULL
);
CREATE TABLE IF NOT EXISTS portfolio_images (
  id SERIAL8 NOT NULL PRIMARY KEY,
  image BYTEA NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  index SMALLINT NOT NULL,
  project_id SERIAL8 NOT NULL
);
CREATE TABLE IF NOT EXISTS information (
  about TEXT NOT NULL,
  contact TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS social_accounts (
  id VARCHAR(255) NOT NULL,
  icon VARCHAR(63) NOT NULL,
  link VARCHAR(255) NOT NULL
);

--name: insert-project
INSERT INTO projects (title, description, date) VALUES ($1, $2, $3);

--name: update-project
UPDATE projects SET title=$1, description=$2, date=$3 WHERE id=$4;

--name: delete-project
DELETE FROM projects WHERE id=$1;

--name: insert-project-image
INSERT INTO project_images (project_id, text, image, index) VALUES ($1, $2, $3, $4);

--name: update-project-image
UPDATE project_images SET project_id=$1, text=$2, image=$3, index=$4 WHERE id=$5;

--name: delete-project-image
DELETE FROM project_images WHERE id=$1;

--name: insert-home-image
INSERT INTO home_images (image, index) VALUES ($1, $2);

--name: update-home-image
UPDATE home_images SET image=$1, index=$2 WHERE id=$3;

--name: delete-home-image
DELETE FROM home_images WHERE id=$1;

--name: insert-portfolio-image
INSERT INTO portfolio_images (image, title, description, index, project_id) VALUES ($1, $2, $3, $4, $5);

--name: update-portfolio-image
UPDATE portfolio_images SET image=$1, title=$2, description=$3, index=$4, project_id=$5 WHERE id=$6;

--name: delete-portfolio-image
DELETE FROM portfolio_images WHERE id=$1;

--name: insert-information
INSERT INTO information (about, contact) VALUES ($1, $2);

--name: update-information
UPDATE information SET about=$1, contact=$2;

--name: insert-social-account
INSERT INTO social_accounts (id, icon, link) VALUES ($1, $2, $3);

--name: update-social-account
UPDATE social_accounts SET id=$1, icon=$2, link=$3 WHERE id=$4;

--name: delete-social-account
DELETE FROM social_accounts WHERE id=$1;