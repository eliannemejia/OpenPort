# OPENPORT
In a world increasingly torn by conflict, our proof of concept app OPENPORT is a digital lifeline for those navigating the asylum process. Whether you're a displaced refugee, an EU commissioner allocating aid, or a lawyer offering pro bono support, our platform delivers tailored insights from our extensive global asylum database.

Our app features 2 machine learning models, a logistic regression model for the asylum seeker persona, and a time series autoregression model under the EU commissioner persona. Both models used data from the Eurostat API. The only other page with real data is the "See Decision Stats per Capita" page under the EU Commissioner persona. It contains data from the Eurostat API and the World Bank. All other data shown on the app is mock data. 


# Our team
Mahika Modi, Alp Berrak, Jessica Poblete, Elianne Mejia

## How to build the containers../
Before running the containers, make sure you create the following secret file in the `secrets/` directory:

1. `.env`
   - Contains environment variables for MySQL database setup
   - Example contents:
     ```env
     MYSQL_ROOT_PASSWORD=password
     MYSQL_DATABASE=rethread_db
     MYSQL_USER=rethread_user
     MYSQL_PASSWORD=rethread_pass
     ```

### Starting the Containers
To start the backend, database, and frontend:

```bash
docker compose up -d


Inside the root folder, create a .env file with the following contents:
DB_USER=root
DB_HOST=db
DB_PORT=3306
DB_NAME=openport_database


Start Docker Containers
Use Docker Compose to start all containers:
docker compose up -d
