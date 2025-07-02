# Usa uma imagem oficial do PHP com Apache na versão 8.2.
# Esta imagem já vem com um servidor web (Apache) e PHP configurados.
FROM php:8.2-apache

# Define o diretório de trabalho dentro do container.
# É para onde seus arquivos de aplicação serão copiados.
WORKDIR /var/www/html

# Copia a pasta do seu projeto PHP (CRUD-Pesqueiro) para dentro do diretório de trabalho do container.
# Ela será acessível em /var/www/html/CRUD-Pesqueiro no container.
COPY ./CRUD-Pesqueiro /var/www/html/CRUD-Pesqueiro

# Ativa o módulo de reescrita de URLs do Apache.
# Isso é importante para que as suas rotas no PHP funcionem corretamente (ex: /usuario/create).
RUN a2enmod rewrite

# Expõe a porta 80 do container.
# Esta é a porta padrão que o servidor Apache no container vai "ouvir".
EXPOSE 80

# Define o comando que será executado quando o container iniciar.
# Ele inicia o servidor Apache em primeiro plano, para que o container continue rodando.
CMD ["apache2-foreground"]