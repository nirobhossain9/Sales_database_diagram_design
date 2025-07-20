CREATE TABLE `Customers_details`(
    `Cust_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Address` VARCHAR(255) NOT NULL,
    `Phone` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
CREATE TABLE `Order_Details`(
    `order_details_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT NOT NULL,
    `food_types_id` VARCHAR(255) NOT NULL,
    `rider_id` BIGINT NOT NULL,
    `quantity` BIGINT NOT NULL
);
CREATE TABLE `Riders_details`(
    `rider_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `emp_no` BIGINT NOT NULL,
    `branch_id` BIGINT NOT NULL,
    `First_Name` VARCHAR(255) NOT NULL,
    `Last_name` VARCHAR(255) NOT NULL,
    `hire_date` DATE NOT NULL,
    `Gender` CHAR(255) NOT NULL,
    `Birth_date` DATE NOT NULL
);
CREATE TABLE `Dep_employee`(
    `emp_no` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dept_no` BIGINT NOT NULL,
    `branch_id` BIGINT NOT NULL,
    `from_date` DATE NOT NULL,
    `to_date` DATE NOT NULL
);
CREATE TABLE `Department`(
    `dept_no` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dept_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `Titles`(
    `emp_no` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titles` VARCHAR(255) NOT NULL,
    `from_date` DATE NOT NULL,
    `to_date` DATE NOT NULL
);
CREATE TABLE `Dept_manager`(
    `emp_no` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dep_no` BIGINT NOT NULL,
    `branch_id` BIGINT NOT NULL,
    `from_date` BIGINT NOT NULL,
    `to_date` BIGINT NOT NULL
);
CREATE TABLE `Food_types`(
    `food_types_id` CHAR(255) NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Category` VARCHAR(255) NOT NULL,
    `ingredients` VARCHAR(255) NOT NULL,
    `price` BIGINT NOT NULL,
    PRIMARY KEY(`food_types_id`)
);
CREATE TABLE `Orders`(
    `order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cust_id` BIGINT NOT NULL,
    `date` DATE NOT NULL,
    `time` TIMESTAMP NOT NULL,
    `Payment_method` VARCHAR(255) NOT NULL,
    `Payment_status` VARCHAR(255) NOT NULL,
    `Order_Status` VARCHAR(255) NOT NULL
);
CREATE TABLE `Branches`(
    `branch_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `branch_name` VARCHAR(255) NOT NULL,
    `region` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone_number` CHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Dep_employee` ADD CONSTRAINT `dep_employee_branch_id_foreign` FOREIGN KEY(`branch_id`) REFERENCES `Branches`(`branch_id`);
ALTER TABLE
    `Order_Details` ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Orders`(`order_id`);
ALTER TABLE
    `Dep_employee` ADD CONSTRAINT `dep_employee_dept_no_foreign` FOREIGN KEY(`dept_no`) REFERENCES `Department`(`dept_no`);
ALTER TABLE
    `Riders_details` ADD CONSTRAINT `riders_details_emp_no_foreign` FOREIGN KEY(`emp_no`) REFERENCES `Dep_employee`(`emp_no`);
ALTER TABLE
    `Dep_employee` ADD CONSTRAINT `dep_employee_emp_no_foreign` FOREIGN KEY(`emp_no`) REFERENCES `Titles`(`emp_no`);
ALTER TABLE
    `Riders_details` ADD CONSTRAINT `riders_details_branch_id_foreign` FOREIGN KEY(`branch_id`) REFERENCES `Branches`(`branch_id`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_cust_id_foreign` FOREIGN KEY(`cust_id`) REFERENCES `Customers_details`(`Cust_id`);
ALTER TABLE
    `Order_Details` ADD CONSTRAINT `order_details_rider_id_foreign` FOREIGN KEY(`rider_id`) REFERENCES `Riders_details`(`rider_id`);
ALTER TABLE
    `Order_Details` ADD CONSTRAINT `order_details_food_types_id_foreign` FOREIGN KEY(`food_types_id`) REFERENCES `Food_types`(`food_types_id`);
ALTER TABLE
    `Dept_manager` ADD CONSTRAINT `dept_manager_dep_no_foreign` FOREIGN KEY(`dep_no`) REFERENCES `Dep_employee`(`dept_no`);
ALTER TABLE
    `Dept_manager` ADD CONSTRAINT `dept_manager_branch_id_foreign` FOREIGN KEY(`branch_id`) REFERENCES `Branches`(`branch_id`);