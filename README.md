# e-global-zone_Docker

### SET UP

1. Clone docker-compose File 

    ```git
    git clone https://github.com/JeongJaeSoon/e-global-zone_Docker.git
    ```

2. Directory cleanup & docker-compose build / up

    ```bash
    $ rm -r ./mysql/*
    $ docker-compose build && docker-compose up -d
    ```
    
3. Clone E_Global_Zone Laravel Project to `src`
    
    ```git
    git clone https://github.com/JeongJaeSoon/e-global-zone_Laravel-project_Project-management.git
    ```
   
4. Deployment Laravel Project

    ```bash
    $ cd src
    $ composer install
    $ cp .env.example .env 
    $ php artisan key:generate
    ```