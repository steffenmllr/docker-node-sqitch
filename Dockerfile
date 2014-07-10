FROM bradrydzewski/node:0.10
MAINTAINER Steffen Mueller <steffen@mllrsohn.com>

RUN sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
RUN sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN sudo apt-get update

RUN sudo apt-get -y -q install git make cmake gcc g++ build-essential libssl-dev python-software-properties software-properties-common
RUN sudo apt-get -y -q install postgresql-client-9.3
RUN sudo apt-get -y -q install perl liblocal-lib-perl libpq-dev cpanminus
RUN sudo apt-get -y clean

# Install Sqitch
RUN sudo cpanm -n App::Sqitch
RUN sudo cpanm -n DBD::Pg