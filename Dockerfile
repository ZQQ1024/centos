FROM centos

LABEL maintainer “qiangqiang.zhou@changhong.com”

RUN rm -rf /etc/localtime && \
ln -s /usr/share/zoneinfo/$TZ /etc/localtime && \
localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV LANG=zh_CN.utf8  \
LC_ALL=zh_CN.utf8  \
TZ=Asia/Shanghai

