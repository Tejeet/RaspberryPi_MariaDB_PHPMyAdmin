#!/bin/bash

echo "\nInstalling MYSQL, Apache, and phpMyAdmin Server"

# Define the blue color
BLUE='\033[34m'
NC='\033[0m' # No Color

# Step 0: Update and Upgrade System Packages
echo -e "${BLUE}Updating and upgrading system packages...${NC}"
sudo apt-get update
sudo apt-get upgrade -y

# Step 1: Install GitHub
echo -e "${BLUE}Installing GitHub...${NC}"
sudo apt-get install git -y

# Step 2: Install Supervisor
echo -e "${BLUE}Installing Supervisor...${NC}"
sudo apt install supervisor -y
echo -e "${BLUE}Checking Supervisor version...${NC}"
sudo supervisorctl version

# Step 3: Install MariaDB (MySQL Alternative)
echo -e "${BLUE}Installing MariaDB server and client...${NC}"
sudo apt-get install mariadb-server mariadb-client -y

# Step 4: Install Apache Web Server
echo -e "${BLUE}Installing Apache web server...${NC}"
sudo apt-get install apache2 -y

# Enable Apache's rewrite module
echo -e "${BLUE}Enabling Apache rewrite module...${NC}"
sudo a2enmod rewrite

# Step 5: Install PHP and Required Modules
echo -e "${BLUE}Installing PHP and necessary modules...${NC}"
sudo apt-get install php libapache2-mod-php php-mysql -y

# Restart Apache to apply PHP integration
echo -e "${BLUE}Restarting Apache...${NC}"
sudo systemctl restart apache2

# Step 6: Install phpMyAdmin
echo -e "${BLUE}Installing phpMyAdmin...${NC}"
sudo apt-get install phpmyadmin -y

# Step 7: Configure Apache to Include phpMyAdmin
echo -e "${BLUE}Configuring Apache to include phpMyAdmin...${NC}"
sudo sh -c "echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf"

# Step 8: Restart Apache to Apply Changes
echo -e "${BLUE}Restarting Apache to apply configuration changes...${NC}"
sudo systemctl restart apache2

# Step 9: Add MySQL user in DB
echo -e "${BLUE}Configuring MySQL root user...${NC}"

# Step 10: Modify User Permissions
echo -e "${BLUE}Modify MYSQL user Permissions...${NC}"
sudo mysql -u root <<EOF
DROP USER IF EXISTS 'root'@'localhost';
CREATE USER 'root'@'localhost' IDENTIFIED BY 'mypass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo -e "${BLUE}Installation complete. You now have a LAMP stack with phpMyAdmin configured on your Raspberry Pi.${NC}"
