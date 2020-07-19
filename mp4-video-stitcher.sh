#!/bin/bash

SOURCE=$1
DEST=$2
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TEMP=$DIR/tmp
LOG=$DIR/log

MP4_LIST=$(find $1 -type f -name '*.mp4' | sort)

echo "Converting MP4s to TS files..."
for file in $MP4_LIST
do

        name=$(basename $file)
        core_name="${name%.*}"

        ffmpeg -i $file -map 0 -c copy -f mpegts -bsf:v h264_mp4toannexb $TEMP/$core_name.ts >> $LOG/TS_CONVERT_$(date +"%Y-%m-%d").log 2>&1 &
done
echo "Conversion finished."

TS_LIST=$(find $TEMP -type f -name '*.ts' | sort)

CONCAT_LIST=$TEMP/concat_list.txt

echo "Concatenating TS files together..."
for file in $TS_LIST
do
        cat $file >> $DEST/temp.ts
done
echo "Concatenating finished."

echo "Converting TS file back to MP4..."
ffmpeg -i $DEST/temp.ts -c copy $DEST/output.mp4

rm $DEST/temp.ts
find $TEMP/ -name '*' | xargs rm -v
