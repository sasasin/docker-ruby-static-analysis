FROM ruby:2.6.3
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
