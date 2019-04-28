# ruby-static-analysis

Ruby, Ruby on Rails用の静的解析ツール詰め合わせのDockerイメージです。

# ローカルで使う

解析したいソースのディレクトリをコンテナにマウントして、コンテナ起動。パスの通ったところに色々入ってるので、よしなに使ってください。

```
$ docker run -it -v $(pwd):/src sasasin/docker-ruby-static-analysis:latest /bin/bash
root@8b339a758568:/# which rubycritic
/usr/local/bundle/bin/rubycritic
root@8b339a758568:/# ls /usr/local/bundle/bin/
brakeman      bundler-audit	 erubis  flog	  launchy  rubocop     ruby-rewrite  ruby_parse_extract_error  thor
bundle-audit  code_climate_reek  flay	 kwalify  reek	   ruby-parse  ruby_parse    rubycritic
root@8b339a758568:/# bundle audit check --update
```

# CIで使う

ex; CircleCI

```
jobs:
  build:
    docker:
      - image: sasasin/docker-ruby-static-analysis:latest
    steps:
      - checkout
      - run: bundle audit check --update || true
```
