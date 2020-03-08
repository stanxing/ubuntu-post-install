
#!/bin/bash -e

install_sogoupinyin() {
    if which sogou-qimpanel &> /dev/null; then
        echo "The sogoupinyin already exists."
        return
    fi
    wget "http://cdn2.ime.sogou.com/dl/index/1571302197/sogoupinyin_2.3.1.0112_amd64.deb?st=M3cdneQZ4uNiJB_OgUQEZg&e=1583496146&fn=sogoupinyin_2.3.1.0112_amd64.deb" \
        -o /tmp/sogoupinyin_2.3.1.0112_amd64.deb
    sudo dpkg -i /tmp/sogoupinyin_2.3.1.0112_amd64.deb
    sudo apt-get install -f
    echo "Completed to install sogoupinyin."
}

install_sogoupinyin