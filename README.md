# Docker で Movable Type 7 向け LAMP 環境を構築

この docker-compose は [Web Proxy](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion) に依存するため、あらかじめそちらの環境を構築しておく必要があります。

## Usage

macOS での説明となりますので、他の環境であれば適宜読み替えてください。

1. リポジトリのクローン

    ```bash
    git clone git@github.com:dreamseeker/docker-movabletype-letsencrypt.git
    ```

2. `.env` ファイルの準備

    `.env.sample` を `.env` にリネームして、設定内容を調整します。

    ```env
    # .env file to set up your site
    
    # ---------------------------------
    # Network name
    # ---------------------------------
    # Your container app must use a network conencted to your webproxy
    # https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion
    #
    NETWORK=webproxy
    
    
    # ---------------------------------
    # Container General configuration
    # ---------------------------------
    CONTAINER_BASE_NAME=web
    
    
    # ---------------------------------
    # Database Container configuration
    # ---------------------------------
    # Path to store your database
    DB_PATH=./db
    
    # Root password for your database
    MYSQL_ROOT_PASSWORD=root_password
    
    # Database name, user and password for Movable Type
    MYSQL_DATABASE=database_name
    MYSQL_USER=user_name
    MYSQL_PASSWORD=user_password
    
    # Host Database port
    HOST_MYSQL_PORT=3306
    
    
    # ---------------------------------
    # Apache Container configuration
    # ---------------------------------
    # Path to store your local files
    APACHE_BASE_PATH=./htdocs

    # Path to store your cms files
    CMS_BASE_PATH=./mt
    
    # Your domain (or domains)
    DOMAINS=domain.com
    
    # Your email for Let's Encrypt register
    LETSENCRYPT_EMAIL=your_email@domain.com
    
    # Self-Signed Certificate name
    CERT_NAME=default
    
    # HTTPS method type
    HTTPS_METHOD=noredirect
    ```
    
    macOS のローカル環境など、Let's Encrypt がうまく動作せず [Web Proxy](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion) で用意した自己署名証明書を利用する場合は、 `CERT_NAME` に証明書のファイル名をセットし、docker-compose.yml に含まれる下記2行のコメントアウトを解除します。
    
    ```
    # CERT_NAME: ${CERT_NAME}
    # HTTPS_METHOD: ${HTTPS_METHOD}
    ```

3. `/etc/hosts` の調整

    ホストの hosts ファイルを調整します。  
    [Web Proxy](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion) の IP 指定が `127.0.0.1` で、前述の `.env` を用意した場合、下記のように指定します。

    ```bash
    127.0.0.1   domain.com
    ```

4. mt-config.cgi の設定

    Terminal.app などで、下記を実行します。

    ```bash
    /bin/bash setup-mt7.sh
    ```

5. Movable Type 本体の入手

    Movable Type 本体を入手したら `.env` の `CMS_BASE_PATH` で指定されたパスに配置してください。

6. コンテナの起動と初期化

    ```bash
    docker-compose up -d --build
    ```
    
    （設定を調整しない限り）2回目以降 `--bulid` の指定は不要です。
    
7. ブラウザでアクセス

    `https://domain.com/mt/mt.cgi` にアクセスすると Movable Type 7 のインストール画面が表示されます。
    
## Relations

**dreamseeker/docker-craft3-letsencrypt: Docker で Craft 3 向け LAMP 環境を構築**  
[https://github.com/dreamseeker/docker-craft3-letsencrypt](https://github.com/dreamseeker/docker-craft3-letsencrypt)

**dreamseeker/docker-craft2-letsencrypt: Docker で Craft CMS 向け LAMP 環境を構築**  
[https://github.com/dreamseeker/docker-craft2-letsencrypt](https://github.com/dreamseeker/docker-craft2-letsencrypt)

## Special Thanks

**evertramos/docker-wordpress-letsencrypt: Wordpress Docker container using SSL Certificates with LetsEncrypt**  
[https://github.com/evertramos/docker-wordpress-letsencrypt](https://github.com/evertramos/docker-wordpress-letsencrypt)