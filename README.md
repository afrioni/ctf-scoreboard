# CTF-Scoreboard

### What is this?

This repository is for the scoreboard used to run MITRE capture the flag competitions.

### How to Run Locally

1. Install ruby.
2. In your terminal run `gem install bundle`
3. Run `bundle install`
4. Run `bundle exec rails s`
5. Open the webpage shown in your terminal from the last command in your browser.

### How do I contribute?

1. Fork the repository on github
2. Run `git clone [address]`
3. Make your edits
4. View your edits
5. Run the git add and commit commands. Please make sure your commit messages are descriptive.
6. Run `git push origin master`
7. Submit a pull request

### (Optional) Using included Dockerfile for development

This repository features a Dockerfile that is used strictly for local development purposes. It provides the user with a consistant local environment to develop on no matter their OS. In order to use it:

0. These instructions assume you already have Docker configured and working on your system.
1. Clone repository locally.
2. Run `docker build -t mitre-cyber-academy/ctf-scoreboard-dev .` from the root of the repository to build the image.
3. Run ``docker run -d --name ctf-scoreboard-dev -v `pwd`:/src/ctf-scoreboard -p 3000:3000 mitre-cyber-academy/ctf-scoreboard-dev`` to start the image.
4. Run `docker exec ctf-scoreboard-dev bundle exec rake db:migrate`. This should only have to be run once. Once the db is migrated it will be stored separate from the container.
4. Run `docker exec ctf-scoreboard-dev bundle exec rake db:seed`. This should also only have to be run once as it will populate your host directory with the needed changes.
5. Navigate in your browser to your Docker host at port 3000. The scoreboard will display.
6. Make your changes on your local system. The docker container will stay in sync with your local filesystem automatically and changes will show up in the browser.
