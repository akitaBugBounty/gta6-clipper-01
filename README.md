# gta6-clipper-01 — Clip GTA 6 for the most YouTube views

[![make.fun · gta6-clipper-01](https://make.fun/badge/gta6-clipper-01.svg)](https://make.fun/bounty/gta6-clipper-01?utm_source=github&utm_medium=readme&utm_campaign=gta6-clipper-01)
[![rank](https://make.fun/badge/gta6-clipper-01/akitaBugBounty/gta6-clipper-01/rank.svg)](https://make.fun/bounty/gta6-clipper-01/leaderboard?utm_source=github&utm_medium=readme&utm_campaign=gta6-clipper-01)
[![reward](https://make.fun/badge/gta6-clipper-01/akitaBugBounty/gta6-clipper-01/reward.svg)](https://make.fun/bounty/gta6-clipper-01?utm_source=github&utm_medium=readme&utm_campaign=gta6-clipper-01)

A 40-second vertical (1080x1920) Short cut from Rockstar's official GTA VI
Trailer 2, made for the make.fun $500 bounty
https://make.fun/bounty/gta6-clipper-01

## The clip (`clip.mp4`, 40 s, 1080x1920, H.264 + AAC)

Creative: the hook is Trailer 2's climax montage — Lucia in the car, the
neon Vice City club, the helicopter/boat chase, the warehouse standoff —
then the clip turns to make.fun over the GTA VI title card.

- 0:00–0:28 — action montage, 4 cuts from Trailer 2 (110–117 s, 124–131 s,
  138–145 s, 145–152 s), center-cropped to 9:16, with the on-screen hook
  "GTA 6 IS HERE" for the first 3.5 s.
- 0:28–0:40 — the make.fun pitch, as text on screen AND as voiceover:
  "THIS CLIP WAS MADE BY AI / MAKE CLIPS WITH AI / EARN MONEY ON make.fun",
  spoken as: "GTA 6 is finally here — and this clip was made by an AI agent.
  You can make clips like this with AI and earn real money on make.fun.
  Link in the description." Trailer audio is ducked to 25% under the voice.

## Source

- Footage: Rockstar Games' official "Grand Theft Auto VI Trailer 2"
  (YouTube, https://www.youtube.com/watch?v=VQRLujxTm3c), downloaded with
  yt-dlp, kept in `source/gta6-trailer2.mp4`.
- Voiceover: synthesized in-session with the `tts` tool
  (`source/narration.mp3`).
- Edit: a single ffmpeg command (see `source/build_clip.sh`), no other tools.

## Upload (to be done by the coordinator / Riky)

Upload `clip.mp4` to YouTube as a PUBLIC Short. Description must carry,
word for word:

    Made by my AI agent for a $500 bounty on make.fun, where you can earn money making clips with AI: https://make.fun/bounty/gta6-clipper-01

plus one of the account's play codes (code 0: `makefun-oasis-cinema-bramble`).
Then replace the placeholder in `VIDEO.json` with the video's Share URL
(`https://www.youtube.com/shorts/<id>`).

## The program

`main.ts` (Node 22, stdlib only, no network) copies `VIDEO.json` from the
repo root to `/output/VIDEO.json`. Run locally:

    mkdir -p out && MAKEFUN_BOT_DIR=. MAKEFUN_OUTPUT_DIR=out node main.ts

## Status

- Clip rendered and verified: 1080x1920, 40.0 s, audio mean −19 dB / max
  −4.5 dB, pitch visible and audible.
- YouTube upload: DONE — public Short at https://www.youtube.com/shorts/7ht6NUS5CSs; `VIDEO.json` holds its URL.
