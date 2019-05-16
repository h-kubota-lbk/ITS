# 構築手順

## 前提条件

  vagrant, VirtualBoxインストール済（なるべく最新のもの）

  githubのアカウント発行済

  githubアカウントに公開鍵を登録済(ローカルに秘密鍵を設置前提)

  [windowsのみ] ↓↓↓

    コマンドプロンプトを管理者権限で実行すること

    コマンドプロンプト上でlinuxコマンドを使える状態であること

    ( busybox64を使用するかwslを使用するとよいかも )

## 必要なコマンドを入力
```
$ vagrant plugin install vagrant-bindfs

# [windowsのみ]
$ vagrant plugin install vagrant-winnfsd

# [macのみ?]
$ vagrant plugin install vagrant-vbguest

# [macのみ]
$ sudo touch /etc/exports
$ sudo nfsd enable
```

## 初期ディレクトリ構造

```
.
├── myapp
│      ├── script
│      │     ├── init
│      │     └── bootstrap
│      ├── template
│      │     └── database.yml
│      ├── .gitignore
│      ├── .env.dev.sample
│      ├── docker-compose.yml
│      ├── Dockerfile.dev
│      ├── Gemfile
│      └── Gemfile.lock
└── Vagrantfile
```

## コマンド入力
```
$ mkdir -r iwatapp/myapp
$ cd iwatapp/myapp
$ git clone git@github.com:h-kubota-lbk/ITS.git
$ cp Vagrantfile ../Vagrantfile
$ cd ../
$ vagrant up && vagrant ssh
```

## 仮想環境入ってからのコマンド入力
```
$ cd shared/myapp
$ chmod -R u+x script/
$ script/init && script/bootstrap
```

## Usage

### dockerコマンドは仮想環境内で

### gitコマンドはローカルPCからで

  herokuコマンドも同様

### 
