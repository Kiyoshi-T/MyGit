#!binbash
#######################################################
#�[���l�̃_�~�[�t�@�C�������A�R�s��A�����̓����
#�^�����l�̃f�B���C�������ČJ��Ԃ��܂�
#�g�����F
#�@$ .  iotest.sh [�t�@�C���T�C�YMB] [�f�B���C�b]
#�f�B���C�b�́@1s�i�P�b�j�ȂǂŎw��
#######################################################

while 
do

echo `hostname`  `date` ;


#�_�~�[�t�@�C���쐬 dummy file zero data 1MBxX
dd if=devzero of=dummy100M bs=1M count=$1

  cp dummy100M dummy100M-B
  rm -f dummy100M
  rm -f dummy100M-B

  msleep $2

done
