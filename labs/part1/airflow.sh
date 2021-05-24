wget https://raw.githubusercontent.com/yasheshshroff/NLPworkshop/main/labs/07a_disaster_detection_tfidf.py -O diaster_detection_tfidf.py
wget https://raw.githubusercontent.com/yasheshshroff/NLPworkshop/main/labs/07a_predict_disaster_tfidf.py -O predict_disaster_tfidf.py
wget https://github.com/yasheshshroff/NLPworkshop/raw/main/labs/dataset/disaster_data.zip
unzip disaster_data.zip
head -50 disaster_data/train.csv > disaster_data/predict.csv
conda activate pytorch_p36
pip install -r airflow_requirements.txt
sudo apt install docker-compose -y

# add user
sudo adduser airflow
sudo usermod -aG sudo airflow
su - airflow

export AIRFLOW_HOME=$HOME/airflow
chmod +x $AIRFLOW_HOME/start-airflow.sh
chown -R airflow:airflow $AIRFLOW_HOME
sh ./start-airflow.sh


