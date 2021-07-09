FROM ruby:3.0.2
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
