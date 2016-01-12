FROM rails:4.2.5

WORKDIR /src/ctf-scoreboard

# Copy only the Gemfiles over since they are all thats required during the build
# process. The rest of the code will be linked in using a volume at runtime.
COPY Gemfile /src/ctf-scoreboard/
COPY Gemfile.lock /src/ctf-scoreboard/
RUN bundle install

VOLUME /src/ctf-scoreboard

# Default command is to run a rails server on port 3000
CMD ["rails", "server", "--binding", "0.0.0.0", "--port", "3000"]
EXPOSE 3000