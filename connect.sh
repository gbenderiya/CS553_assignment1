PORT=21008
MACHINE=paffenroth-23.dyn.wpi.edu
KEY_FOLDER = "C:/Users/ganer/Documents/GitHub/MLOPs/Keys"



ssh -i $KEY_FOLDER/mykey -p ${PORT} -o StrictHostKeyChecking=no student-admin@${MACHINE}