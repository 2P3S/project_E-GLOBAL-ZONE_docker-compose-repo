# e-global-zone_Docker

### SET UP

1. Clone docker-compose File 

    ```bash
    $ git clone https://github.com/JeongJaeSoon/e-global-zone_Docker.git
    ```

2. Directory cleanup & docker-compose build / up

    ```bash
    $ cd e-global-zone_Docker
    $ mkdir mysql
    $ docker-compose build && docker-compose up -d
    ```
    
3. Check Nginx Server Status (localhost:8888)
    <img src="https://user-images.githubusercontent.com/53788601/90328235-d7d04480-dfd5-11ea-8863-a0efcd0b9fd9.png"/>

4. Clone E_Global_Zone Laravel Project to `src`
    
    ```bash
    $ rm -r src/E_Global_Zone
    $ git clone https://github.com/JeongJaeSoon/e-global-zone_Laravel-project_Project-management.git
    $ mv e-global-zone_Laravel-project_Project-management/E_Global_Zone src
    $ rm -rf e-global-zone_Laravel-project_Project-management
    ```
   
5. Deployment Laravel Project

    ```bash
    $ cd src/E_Global_Zone
    $ composer install
    $ cp .env.example .env
    ```
    ```
    modify .env DB setting
    ```
    ```
    $ php artisan key:generate
    $ docker-compose exec php php /var/www/html/E_Global_Zone/artisan migrate
    $ docker-compose exec php php /var/www/html/E_Global_Zone/artisan passport:install
    $ docker-compose exec php chown -R www-data:www-data /var/www/html/E_Global_Zone
    ```