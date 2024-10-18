# Try Sinatra

## これは何？

フィヨルドブートキャンプのプラクティス「Sinatra を使って Web アプリケーションの基本を理解する」のためのリポジトリです。
sinatra で構築されたシンプルなメモアプリを提供します。

## セットアップ手順

```sh
$ git clone https://github.com/mochiz/try-sinatra.git
$ cd try-sinatra
$ bundle
```

環境変数に postgresql の user, password を設定してください

```sh
export PG_USER=XXXX
export PG_PASSWORD=XXXX
```

DB をセットアップする。

```sh
$ rake db:create
```

アプリを起動する

```sh
$ bundle exec ruby app.rb
```

http://localhost:4567/ でメモアプリを表示できること

## その他

不要になった DB は db:drop コマンドで削除してください

```sh
$ rake db:drop
```
