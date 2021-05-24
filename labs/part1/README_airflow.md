# Setting up Airflow on AWS

```shell
# 1. set the environment (portability) in ~/.bashrc
export AIRFLOW_HOME=/home/ubuntu/airflow

# 2. activate the ML environment
source activate pytorch_p36

# 3. install airflow
pip install apache-airflow

# 4. initialize the database
airflow db init

# 5. create a new user
airflow users create --username admin --firstname Warren --lastname Buffet --role Admin --email nowhere@here.com

# password: a1rfl0w

# 6. get the config file
cd airflow
wget https://raw.githubusercontent.com/yasheshshroff/NLPworkshop/main/labs/airflow.cfg -O airflow.cfg

# 7. create the dags folder
mkdir dags

wget https://raw.githubusercontent.com/yasheshshroff/NLPworkshop/main/labs/ml_pipeline.py -O dags/ml_pipeline.py

# 8. Start the scheduler
airflow scheduler

# 9. Start the webserver in a different terminal
source activate pytorch_p36
airflow webserver

# Note: 8 & 9 can be combined into one step:
airflow scheduler &> /dev/null
airflow webserver &> /dev/null

```

## Running Airflow

* Go to the ec2 public IP address <ec2.compute>:8080
* Start the DAG tasks


## Running with Docker
 
* ssh into the ec2 public IP
* Get the docker files

```sh
wget https://raw.githubusercontent.com/yasheshshroff/NLPworkshop/main/labs/airflow_docker_demo.zip
unzip airflow_docker_demo.zip
cd airflow_docker_demo
sudo apt install docker-compose
docker-compose build
docker-compose up -d

# Go to ec2-compute:8080 & start your DAG
docker-compose down
```

### Docker 

This is what you should observe:

```sh
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                   PORTS                                        NAMES
1d9d00b87963   nlp/airflow    "/entrypoint.sh ./st…"   6 minutes ago   Up 5 minutes (healthy)   5555/tcp, 8793/tcp, 0.0.0.0:8080->8080/tcp   airflow
81efda6b41e2   nlp/postgres   "docker-entrypoint.s…"   6 minutes ago   Up 6 minutes (healthy)   0.0.0.0:32769->5432/tcp                      postgres
```



