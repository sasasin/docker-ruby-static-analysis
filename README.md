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
  static-analysis:
    docker:
      - image: sasasin/docker-ruby-static-analysis:latest
    steps:
      - checkout
      - run: mkdir -p tmp/{rubocop,brakeman,rubycritic}
      - run: bundle audit check --update || true
      - run: bundle exec rubocop -c .rubocop.yml --parallel --format html -o tmp/rubocop/rubocop.html  || true
      - run: bundle exec brakeman -A --no-exit-on-warn --no-exit-on-error -o tmp/brakeman/brakeman-report.html
      - run:bundle exec rubycritic --no-browser --format html --path tmp/rubycritic app lib
      - store_artifacts:
          path: tmp

workflows:
  version: 2
  nightly-workflow:
    triggers:
      - schedule:
          # UTCで記述。下記は、02:00(JST)
          cron: "00 17 * * *"
          filters:
            branches:
              only:
                - master
    jobs:
      - static-analysis
```
