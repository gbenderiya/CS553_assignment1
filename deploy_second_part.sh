#! /bin/bash

PORT=22008
MACHINE=paffenroth-23.dyn.wpi.edu

# Change to the temporary directory
cd tmp

# Add the key to the ssh-agent
eval "$(ssh-agent -s)"
ssh-add my_key

echo "SSH Agent status:"
ssh-add -l

# commands
ssh -i tmp/my_key -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE} "cd project"
ssh -i tmp/my_key -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE} "ls CS553_assignment1"
ssh -i tmp/my_key -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE} "sudo apt install -qq -y python3-venv && echo 'venv installed successfully' || echo 'venv installation failed'"
ssh -i tmp/my_key -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE} "cd CS553_assignment1 && python3 -m venv venv"
ssh -i tmp/my_key -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE} "cd CS553_assignment1 && source venv/bin/activate && pip install -r requirements.txt"
ssh -i tmp/my_key -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE} "nohup CS553_assignment1/venv/bin/python3 CS553_assignment1/app.py > log.txt 2>&1 &"
ssh -i tmp/my_key -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE} "tail -n 20 project/CS553_assignment1/log.txt"


# nohup ./whatever > /dev/null 2>&1 

# debugging ideas
# sudo apt-get install gh
# gh auth login
# requests.exceptions.HTTPError: 429 Client Error: Too Many Requests for url: https://api-inference.huggingface.co/models/HuggingFaceH4/zephyr-7b-beta/v1/chat/completions
# log.txt