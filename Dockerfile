FROM ruby:3.0.3
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
