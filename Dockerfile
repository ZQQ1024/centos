FROM centos
LABEL maintainer “qiangqiang.zhou@changhong.com”

RUN rm -rf /etc/localtime && \
ln -s /usr/share/zoneinfo/$TZ /etc/localtime && \
localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

#添加用户，UID、GID为4001
RUN groupadd user_grp -g 4001 && \
useradd -u 4001 --home-dir /srv/zqq --create-home --system --no-user-group zqq && \
usermod -g user_grp zqq && \
ln -s /srv/zqq /var/lib/zqq && \
chown -R zqq:user_grp /var/lib/zqq

USER zqq

WORKDIR /srv/zqq

ENV LANG=zh_CN.utf8  \
LC_ALL=zh_CN.utf8  \
TZ=Asia/Shanghai

