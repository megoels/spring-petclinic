#!/bin/bash
ADMIN_USER=${ADMIN_USER:-admin}
ADMIN_PASS=${ADMIN_PASS:-tomcat}

# maybe need to set JAVA_OPTS="-Djpa.database=MYSQL -Djdbc.driverClassName=com.mysql.jdbc.Driver -Djdbc.username= -Djdbc.password= -Djdbc.url=’jdbc:mysql://localhost:3306/petclinic?useUnicode=true&characterEncoding=UTF-8′ -Djdbc.initLocation=classpath:db/mysql/initDB.sql -Djdbc.dataLocation=classpath:db/mysql/populateDB.sql -Dhibernate.dialect=org.hibernate.dialect.MySQLDialect -Djava.security.egd=file:/dev/./urandom"

cat << EOF >  $CATALINA_BASE/conf/tomcat-users.xml
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
<user username="${ADMIN_USER}" password="${ADMIN_PASS}" roles="admin-gui,manager-gui"/>
</tomcat-users>
EOF

/bin/sh -e /usr/local/tomcat/bin/catalina.sh run