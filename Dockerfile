FROM ruby:3.1.1
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
