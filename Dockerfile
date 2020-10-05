FROM ruby:2.7.2
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install
CMD ["sh"]
