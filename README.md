# 構築手順

## 前提条件

  * vagrant, VirtualBoxインストール済（なるべく最新のもの）

  * githubのアカウント発行済

  * githubアカウントに公開鍵を登録済(ローカルに秘密鍵を設置前提)

  https://github.com/h-kubota-lbk/ITS
  にアクセスして、フォークする

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

構築時に必要なファイルたちの構造がこうなっていること

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
$ mkdir iwatapp
$ cd iwatapp
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

## 開発の流れ

### 初期準備

```
$ git remote add upstream git@github.com:h-kubota-lbk/ITS.git
```

### 作業開始

#### いったん最新の状態にする

```
$ git fetch upstream

$ git merge upstream/master

(vimが開くと思うので、:qで閉じる)

(conflict起きたら直してcommitする)
```

#### 作業用ブランチを作成する

ブランチ名：「プレフィックス名/機能名」

プレフィックスの種類：

* feature ... 主要機能の作成

(日本語使うのはやめてください)

#### 作業ブランチで作業

### 作業終了時

#### 作業コミットをフォーク先（フォークで作ったリポジトリ）にプッシュ

#### Githubのフォーク先のリポジトリにアクセスし、プルリクエストを作成

リクエスト先は、フォーク元（オリジナルの方）のdevelopブランチ（暫定）

#### 誰かしらレビューしてもらい承認されたらマージされる
