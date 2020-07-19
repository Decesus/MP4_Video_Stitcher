# MP4_Video_Stitcher
A script to help stitch mass amounts of MP4 files together.

Originally created in response to having to deal with the MP4 recordings from Unifi Video, there's no reason it shouldn't work on other folders of MP4 files.  It does sort based on name though, so I'd number files you want to keep in order if they're not already organized.

This is currently the first working version of the script and has sitched ~40k MP4 files stitched together.  I got it to a working state and then uploaded it immediately, as developers do, so there are some quirks:

- It WILL use all of your CPU threads to convert the MP4s to TS files.  I build this for speed, but it could be made to limit the amount of conversions done.

- It's disk space use can be better.  The current use looks like this:  {Orignal Files} -> {Converted TS files} -> {Stitched TS File} -> {Finished MP4}.  Only once the final MP4 is generated do any of the TS files get cleaned up.  Typing this I thought of a solution.  Should be fixed shortly.
 
- It needs a local log/ and tmp/ directory but does not create or check for them.
 
- No codec conversion.  Is it even in scope?


If you're like me, you might be on Google searching for the following:
- "convert ts to mp4 ffmpeg"
- "mp4 concat freezes"
- "stitch two mp4 files together ffmpeg"
- "Unifi video concat mp4 files"
- "ffmpeg concat video without timedata"
- "ffmpeg concat freezes after first video"
- "ffmpeg concatenate videos"
- "ffmpeg concat output freezing"
- "unifi concat all videos"
- "join all unifi video files"
- "increase /var/cache/unifi-video size"
- "unifi video increase tmpfs"


I can't tell you exactly why some of those things happen, but I can tell you I learned it can be a real pain in the ass to figure out.  This script seems to regularly output an MP4 file that's playable and doesn't freeze after the first video in the concat, so I hope it can help some others out.

USAGE: ./mp4-video-stitcher.sh {DIRECTORY WITH SHIT TON OF MP4s} {BIG MP4 DESTINATION}
