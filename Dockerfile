FROM ruby:3.2.0
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
