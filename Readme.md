# Django_Docker

Djangoコンテナを立ち上げるために基礎環境になります

## 事前準備

windows11+wsl2+Ubuntu22+DockerCompose+vscodeでの環境を構築してること。

## 環境構築手順

### 本リポジトリをクローンする

```bash
git clone https://github.com/sacky3105/django_docker.git
cd django_docker
```

後にファイル編集などをして、git通知が煩わしいときまたはプルリクしない場合は
作成したフォルダで以下のコマンドを入れる。

```bash
 rm -rf .git
```

### .envファイルを作成する

```bash
cp .env.example .env
```

### コンテナ稼働する

```bash
cd app
docker-compose build
docker-compose up -d
```

### djangoサイトを構築する(初回)
```bash
docker-compose exec django /bin/bash
django-admin startproject site
mv site/site site/config

vi site/config/settings.py

以下の内容に書き換える
ALLOWED_HOSTS = ['*']

サイトを立ち上げる。
python manage.py runserver 0.0.0.0:8000
```

### サイト確認

http://localhost:8000

### サイトに対し自動起動させる場合

```bash
新しいターミナル開く

cd django_docker/src
mv src/site/ src/
rm -rf site

ここまでの作業について、すでに作成しているDjangoソースを使用する場合、
src配下にソースファイルをおいてもいい。

vi Dockerfile

以下のマスク外す
#COPY boot.sh /root/workspace/
#RUN chmod +x /root/workspace/boot.sh
#ENTRYPOINT ["./boot.sh"]

docker-compose down
docker-compose build
docker-compose up -d
```

### サイト確認

http://localhost:8000

すでに作成したsrcフォルダはどっかのgitリポジトリに保管することをおすすめします
