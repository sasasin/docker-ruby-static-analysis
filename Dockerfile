FROM ruby:2.7.0
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
