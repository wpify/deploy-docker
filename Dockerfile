FROM php:7.4-cli

RUN apt -y update && apt -y upgrade

# Install ssh and rsync
RUN apt install ssh rsync -y

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Install node and yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn

CMD ["bash"]
