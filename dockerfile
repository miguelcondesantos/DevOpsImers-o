# Dockerfile para uma aplicação Python usando Alpine Linux
FROM python:3.13.4-alphine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependências
# Usa o --no-cache-dir para evitar o cache de pacotes
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta 8000 para acesso externo
EXPOSE 8000

# Comando para iniciar a aplicação usando Uvicorn
# 0.0.0.0 permite que a aplicação seja acessível de fora do container
# Reload ativa o recarregamento automático durante o desenvolvimento
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

#marvel