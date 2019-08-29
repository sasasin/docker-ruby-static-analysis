FROM ruby:2.6.4
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
