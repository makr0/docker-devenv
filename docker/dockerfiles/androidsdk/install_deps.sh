#!/usr/bin/env bash

#Android SDK
ANDROID_SDK_FILENAME=android-sdk_r24-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME

#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y openjdk-7-jdk ant expect

curl -O $ANDROID_SDK
tar -xzvf $ANDROID_SDK_FILENAME
#sudo chown -R vagrant android-sdk-linux/
#sudo chown -R vagrant:vagrant /root/.android/

echo "ANDROID_HOME=~/android-sdk-linux" >> /root/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386" >> /root/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /root/.bashrc

expect -c '
set timeout -1   ;
spawn /root/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-22,build-tools-22.1.0
expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'
