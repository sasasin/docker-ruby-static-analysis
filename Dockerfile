FROM ruby:3.1.3
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
