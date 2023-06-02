FROM mysql

# Variáveis de ambiente
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Copia o arquivo SQL para criar o banco de dados inicial
COPY create_database.sql /docker-entrypoint-initdb.d/

# Expondo a porta padrão do MySQL
EXPOSE 3306

# Comando de inicialização padrão
CMD ["mysqld"]
