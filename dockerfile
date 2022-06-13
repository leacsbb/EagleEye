FROM debian:bullseye

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git python3 python3-pip python3-dev wget cmake libgtk-3-dev firefox-esr
RUN wget -c /dev/null https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz -O - | tar -xz -C /usr/bin/
RUN git clone https://github.com/LeacsBB/EagleEye

WORKDIR /EagleEye

RUN pip3 install -r requirements.txt
RUN apt-get install -y libboost-all-dev build-essential libffi-dev
RUN pip3 install --upgrade pip
RUN pip3 install beautifulsoup4 html5lib spry
RUN apt-get clean

ENTRYPOINT ["python3", "eagle-eye.py", "-d"]
