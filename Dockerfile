FROM ruby:3.1.0
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
