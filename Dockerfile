FROM ruby:3.1.2
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
