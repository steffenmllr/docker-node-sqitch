FROM bradrydzewski/node:0.10
MAINTAINER Steffen Mueller <steffen@mllrsohn.com>

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN sudo apt-get update

RUN sudo apt-get -y -q install git make cmake gcc g++ build-essential libssl-dev python-software-properties software-properties-common
RUN sudo apt-get -y -q install postgresql-client-9.3
RUN sudo apt-get -y -q install perl liblocal-lib-perl libpq-dev cpanminus
RUN sudo apt-get -y clean

# Install Sqitch
RUN sudo cpanm -n App::Sqitch
RUN sudo cpanm -n DBD::Pg