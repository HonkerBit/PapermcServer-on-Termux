#!/bin/bash  
if ! type java >/dev/null; then  
    echo "Java is not installed. Attempting to install OpenJDK 17..."   
    yes | pkg update && yes | pkg install openjdk-17  
    if [ $? -ne 0 ]; then  
        echo "Failed to install Java."  
        exit 1  
    fi  
else  
    echo "Java is already installed."  
fi  
if [ ! -f "paper-1.18.2-388.jar" ]; then  
    echo "The JAR file does not exist. Please download it first."  
    exit 1  
fi    
chmod 777 paper-1.18.2-388.jar  
echo "Starting Papermc server..."  
java -Xms1024m -Xmx1024m -jar paper-1.18.2-388.jar nogui  
