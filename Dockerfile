FROM ruby:2.7.1
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
