FROM ruby:3.0.0
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
