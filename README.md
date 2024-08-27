# LAMP Stack and phpMyAdmin Installer for Raspberry Pi

This project provides a shell script to automatically install a LAMP (Linux, Apache, MariaDB, PHP) stack along with phpMyAdmin on a Raspberry Pi. The script simplifies the installation process and ensures all necessary components are properly configured.

## Features

- Installs and configures Apache Web Server
- Installs MariaDB (a MySQL alternative)
- Installs PHP and the necessary PHP modules
- Installs phpMyAdmin for easy database management
- Configures Apache to include phpMyAdmin
- Sets up MySQL root user with proper privileges

## Prerequisites

- A Raspberry Pi with Raspbian or another Debian-based OS installed
- Sudo privileges for the user running the script
- An active internet connection

## Installation

1. Clone this repository or download the `serverSetup.sh` script to your Raspberry Pi:

    ```bash
    git clone https://github.com/Tejeet/RaspberryPi_MariaDB_PHPMyAdmin.git
    cd RaspberryPi_MariaDB_PHPMyAdmin
    ```

2. Make the shell script executable:

    ```bash
    chmod +x serverSetup.sh
    ```

3. Run the script with superuser privileges:

    ```bash
    sudo ./serverSetup.sh
    ```

   This will start the installation process. The script will automatically update your system, install and configure Apache, MariaDB, PHP, and phpMyAdmin.