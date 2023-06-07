FROM fedora:34

# Prerequisites
RUN dnf -y update && dnf -y install curl git unzip xz zip mesa-libGLU wget java-11-openjdk-devel

# Set up new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar xzf android-sdk_r24.4.1-linux.tgz && \
    rm android-sdk_r24.4.1-linux.tgz && \
    (echo y | android-sdk-linux/tools/android -s update sdk --no-ui --filter platform-tools,tools -a ) && \
    (echo y | android-sdk-linux/tools/android -s update sdk --no-ui --filter extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository -a) && \
    (echo y | android-sdk-linux/tools/android -s update sdk --no-ui --filter build-tools-23.0.2,android-24 -a)
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/developer/flutter/bin"

# Run basic check to download Dark SDK
RUN flutter doctor
