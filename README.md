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
    $ git clone https://github.com/JeongJaeSoon/E_Global_Zone-laravel_distributor.git
    $ cp -r E_Global_Zone-laravel_distributor src/E_Global_Zone
    $ rm -rf E_Global_Zone-laravel_distributor
    ```
   
5. Deployment Laravel Project

    ```bash
    $ cd src/E_Global_Zone
    $ composer install
    $ cp .env.example .env
    ```
   
6. modify .env DB setting

7. Set up Laravel Project
    
    ```
    $ php artisan key:generate
    $ docker exec -it php php /var/www/html/E_Global_Zone/artisan migrate
    $ docker exec -it php php /var/www/html/E_Global_Zone/artisan passport:install
    $ docker exec -it php chown -R www-data:www-data /var/www/html/E_Global_Zone/public /var/www/html/E_Global_Zone/storage
    ```
   
8. Run & Check Laravel scheduler crontab

    ```bash
    $ docker exec -it php /usr/sbin/crond
    $ docker exec -it php ps
    ```
   
