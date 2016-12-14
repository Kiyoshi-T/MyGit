#!binbash
#######################################################
#ゼロ値のダミーファイルを作る、コピる、消すの動作を
#与えた値のディレイをかけて繰り返します
#使い方：
#　$ .  iotest.sh [ファイルサイズMB] [ディレイ秒]
#ディレイ秒は　1s（１秒）などで指定
#######################################################

while 
do

echo `hostname`  `date` ;


#ダミーファイル作成 dummy file zero data 1MBxX
dd if=devzero of=dummy100M bs=1M count=$1

  cp dummy100M dummy100M-B
  rm -f dummy100M
  rm -f dummy100M-B

  msleep $2

done
