# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT NOT NULL,
    name VARCHAR(256) NOT NULL,
    description TEXT NOT NULL,
    tag VARCHAR(50) NOT NULL,
    url VARCHAR(256),
    time_commitment VARCHAR(50),
    PRIMARY KEY (id)
);



# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills(id, name, description, tag) values (1,'Flying','Can use Wings','Superpower');
insert into skills(id, name, description, tag) values (2,'Crying','Tears can flow from eyes','Emotions');
insert into skills(id, name, description, tag) values (3,'Excel','Can use Microsoft Excel/Google Sheets','Basic');
insert into skills(id, name, description, tag) values (4,'Programming','Can Program using various languages','Boring');
insert into skills(id, name, description, tag) values (5,'Telepathy','Can read minds','Superpower');
insert into skills(id, name, description, tag) values (6,'Smile','Can use teeth or manipulate the corners of mouth to convey happiness','Emotions');
insert into skills(id, name, description, tag) values (7,'Speaking','Can use vocal cords to create noise and convey language','Basic');
insert into skills(id, name, description, tag) values (8,'HR Skills','HR Skills','Boring');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int,
    people_first_name varchar (256),
    people_last_name varchar(256) NOT NULL,
    email VARCHAR(256),
    linkedin_url VARCHAR(256),
    headshot_url VARCHAR(256),
    discord_handle VARCHAR(256),
    brief_bio TEXT,
    date_joined DATE NOT NULL,

    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,people_last_name,date_joined) values (1,'Person 1','2023-05-08');
insert into people (people_id,people_last_name,date_joined) values (2,'Person 2','2023-06-04');
insert into people (people_id,people_last_name,date_joined) values (3,'Person 3','2023-07-17');
insert into people (people_id,people_last_name,date_joined) values (4,'Person 4','2023-05-27');
insert into people (people_id,people_last_name,date_joined) values (5,'Person 5','2023-06-25');
insert into people (people_id,people_last_name,date_joined) values (6,'Person 6','2023-04-28');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES 
    (1, 1, '2023-01-15'),
    (3, 1, '2023-03-20'),
    (6, 1, '2023-05-10'),
    (3, 2, '2023-06-04'),
    (4, 2, '2023-11-18'),
    (5, 2, '2023-11-17'),
    (1, 3, '2023-11-16'),
    (5, 3, '2023-11-16'),
    (3, 5, '2023-11-18'),
    (6, 5, '2023-11-16'),
    (2, 6, '2023-11-15'),
    (3, 6, '2023-11-17'),
    (4, 6, '2023-11-01'),
    (3, 7, '2023-10-01'),
    (5, 7, '2023-11-11'),
    (6, 7, '2023-11-11'),
    (1, 8, '2023-11-11'),
    (3, 8, '2023-11-11'),
    (5, 8, '2023-11-11'),
    (6, 8, '2023-11-11'),
    (2, 9, '2023-11-01'),
    (5, 9, '2023-11-01'),
    (6, 9, '2023-11-01'),
    (1, 10, '2023-09-01'),
    (4, 10, '2023-09-01'),
    (5, 10, '2023-09-01');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    role_id INT,
    name varchar(256), 
    sort_priority INT
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles(role_id, name, sort_priority)
VALUES 
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    id INT auto_increment PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL
);



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer


INSERT INTO peopleroles (people_id, role_id, date_assigned)
VALUES
    (1, 1, '2023-10-01'),
    (2, 5, '2023-11-11'),
    (2, 6, '2023-11-11'),
    (3, 2, '2023-11-11'),
    (3, 4, '2023-11-11'),
    (4, 3, '2023-11-11'),
    (5, 3, '2023-11-11'),
    (6, 1, '2023-11-11'),
    (6, 2, '2023-11-11'),
    (7, 1, '2023-11-11'),
    (8, 1, '2023-11-11'),
    (8, 4, '2023-11-11'),
    (9, 2, '2023-11-11'),
    (10, 1, '2023-11-11'),
    (10, 2, '2023-11-11');
