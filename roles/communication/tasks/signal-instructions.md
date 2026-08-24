# 1. Download AppImage:
curl -L -O https://updates.signal.org/desktop/signal-desktop.AppImage

# 2. Download our official public AppImage signing key:
curl -o signal-appimage.asc https://updates.signal.org/static/desktop/appimage.asc
gpg --import signal-appimage.asc

# 3. Download signature and verify AppImage:
curl -L -O https://updates.signal.org/desktop/signal-desktop.AppImage.gpg
gpg --verify signal-desktop.AppImage.gpg signal-desktop.AppImage

# The `gpg --verify` command will show the following output for a good signature:
#   gpg: Signature made 
#   gpg: using RSA key 4B16B7232DFAA439AD791002EF9F501F13EED94C
#   gpg: Good signature from "Signal Messenger, LLC "
# You will also see a warning about trusted signatures for that key. This is normal
# and expected unless you manually mark the key as ultimately trusted (e.g. using
# the `gpg --edit-key` command).

# 4. Mark the AppImage as runnable then run it:
chmod +x signal-desktop.AppImage
./signal-desktop.AppImage

# The AppImage auto updates which can be configured in settings.
# For more info and optional setup please visit the Signal Support site:
# https://support.signal.org/hc/articles/360008216551-Installing-Signal