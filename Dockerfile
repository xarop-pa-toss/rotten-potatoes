FROM python:3.8-slim-buster
WORKDIR /app
#Copia arquivo com pacotes a ser instalados
COPY requirements.txt .
# Gestor de pacotes do Python que vai instalar dependências
RUN python -m pip install -r requirements.txt
# Copia os restantes arquivos para dentro da WORKDIR
COPY . /app
EXPOSE 5000
#Comandos a passar à aplicação para a configuração inicial.
CMD [ "gunicorn", "--workers=3", "--bind", "0.0.0.0:5000","-c", "config.py", "app:app"]
