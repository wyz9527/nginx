FROM nginx:1.23

RUN apt-get update && \
    apt-get install -y wget gcc make && \
    wget http://nginx.org/download/nginx-1.23.3.tar.gz && \
    tar -xzvf nginx-1.23.3.tar.gz && \
    cd nginx-1.23.3 && \
    ./configure --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx  --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=ngin x --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_g zip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_st ub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module  --with-http_geoip_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_mo dule --with-cc-opt='-g -O2 -ffile-prefix-map=/data/builder/debuild/nginx-1.23.3/debian/debuild-base/nginx-1.23.3=. -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -Wl,--as-needed -pie' && \
    make && \
    make install