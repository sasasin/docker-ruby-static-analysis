FROM ruby:3.0.1
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
