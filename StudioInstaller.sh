#!/usr/bin/env bash

# Author: Let's FOSS
# Shell Script for Installing JDK, Android Studio & Creating Desktop Icon
# Github: https://github.com/letsfoss/Android-Studio-Installer-Script
# Android Studio Version: 3.5.2.0 on 28/11/2019

# Install JDK8
JDKInstall (){
	printf "Installing JDK8\n"
	sudo apt-get install python-software-properties -y
	sudo add-apt-repository ppa:webupd8team/java -y
	sudo apt-get update -y
	sudo apt-get install oracle-java8-installer -y
	export JAVA_HOME=$(update-alternatives --query javac | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
}

# Download Android Studio
DownloadAndroidStudio (){
	echo "Downloading Android Studio"
	wget "https://dl.google.com/dl/android/studio/ide-zips/3.5.2.0/android-studio-ide-191.5977832-linux.tar.gz"
}

InstallAndroidStudio (){
	echo "Installing Android Studio"
	sudo tar -xzf android-studio-ide-191.5977832-linux.tar.gz -C /opt

	mkdir -p "$HOME"/.local/share/applications
	cat > "$HOME"/.local/share/applications/android-studio.desktop <<-EOF
		[Desktop Entry]
		Version=3.5.2
		Type=Application
		Name=Android Studio
		Exec="/opt/android-studio/bin/studio.sh" %f
		Icon=/opt/android-studio/bin/studio.png
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=android-studio
	EOF

    chmod +x "$HOME"/.local/share/applications/android-studio.desktop



	echo "Installing Finished"
}

JDKInstall
DownloadAndroidStudio
InstallAndroidStudio
