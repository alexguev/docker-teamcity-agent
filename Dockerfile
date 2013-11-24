####################################
# Team City 8 Agent Docker Image
# Tyler Power
# tylerpowerx@gmail.com
####################################

FROM stackbrew/debian:wheezy

ENV TEAM_CITY_BASE_URL http://download-ln.jetbrains.com/teamcity
ENV TEAM_CITY_PACKAGE TeamCity-8.0.2.tar.gz

# change the ENTRYPOINT if you change this! can't find a way to expand ENV VAR inside ""
ENV TEAM_CITY_INSTALL_DIR /usr/local 

RUN apt-get install -y --force-yes wget openjdk-7-jdk
RUN wget -P /tmp/ $TEAM_CITY_BASE_URL/$TEAM_CITY_PACKAGE
RUN tar xfz /tmp/$TEAM_CITY_PACKAGE -C $TEAM_CITY_INSTALL_DIR
RUN rm /tmp/$TEAM_CITY_PACKAGE

ADD agent.sh $TEAM_CITY_INSTALL_DIR/TeamCity/

EXPOSE 9090
ENTRYPOINT ["/usr/local/TeamCity/agent.sh"]
