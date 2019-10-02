FROM ruby:2.6.5
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
