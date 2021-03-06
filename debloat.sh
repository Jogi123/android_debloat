#!/bin/bash


if [[ $(pacman -Q | grep android-tools) == "" ]]
then
  sudo pacman -S android-tools --noconfirm --needed
fi

echo "Starting removal..."

apps=(
  # Facebook apps
  com.facebook.services
  com.facebook.katana
  com.facebook.system
  com.facebook.appmanager

  # Microsoft apps
  com.microsoft.appmanager
  com.microsoft.office.excel                              # Excel
  com.microsoft.office.powerpoint                         # PowerPoint
  com.microsoft.office.word                               # Word
  com.microsoft.skydrive                                  # One drive
  com.skype.raider                                        # Skype

  # Samsung Bixby
  com.samsung.android.app.settings.bixby
  com.samsung.android.bixby.agent
  com.samsung.android.bixby.agent.dummy
  com.samsung.android.bixby.es.globalaction
  com.samsung.android.bixby.plmsync
  com.samsung.android.bixby.service
  com.samsung.android.bixby.voiceinput
  com.samsung.android.bixby.wakeup
  com.samsung.android.bixbyvision.framework
  com.samsung.systemui.bixby
  com.samsung.systemui.bixby2
  com.samsung.android.visionintelligence
  com.samsung.android.app.routines
  com.samsung.android.app.spage

  # Samsung apps
  com.samsung.android.app.watchmanagerstub                    # Galaxy Watch
  com.samsung.android.app.watchmanager                      # Galaxy Watch
  com.samsung.android.arzone                                  # AR Zone
  com.samsung.android.app.tips                                # Tips
  com.samsung.android.ardrawing                               # AR Doodle
  com.sec.android.mimage.avatarstickers                       # Stickers for AR Emoji app
  com.samsung.android.aremoji                                 # AR Emojis
  com.samsung.android.aremojieditor                           # AR Emojis
  com.sec.android.app.sbrowser                                # Samsung Internet browser
  com.samsung.android.mateagent                               # Galaxy friends
  com.samsung.android.scloud                                  # Samsung Cloud
  com.samsung.storyservice                                    # Tracks device activity
  com.samsung.android.game.gamehome                           # Game Launcher
  com.samsung.android.game.gametools                          # Game Launcher
  com.samsung.android.game.gos                                # Game Launcher
  com.samsung.android.kidsinstaller                           # Samsung Kids
  com.samsung.android.app.galaxyfinder                        # Finder
  com.samsung.android.location
  com.sec.android.app.samsungapps                             # Galaxy Store
  com.samsung.android.themestore                              # Galaxy Themes
  com.samsung.android.svoiceime                               # SVoice
  com.samsung.knox.securefolder                               # Secure folder
  com.samsung.android.samsungpass                             # Samsung Pass
  com.samsung.android.samsungpassautofill                     # Samsung Pass
  com.samsung.android.spayfw                                  # Samsung Pay
  com.sec.android.app.billing                                 # Samsung Billing
  com.samsung.android.app.simplesharing                       # Simple Sharing
  com.samsung.android.mobileservice                           # Group sharing

  # Google apps
  com.google.android.apps.tachyon                             # Google Duo
  com.google.android.apps.maps                                # Google Maps
  com.google.android.apps.docs                                # Google Drive
  com.google.android.apps.photos                              # Google Photos
  com.google.android.googlequicksearchbox                     # Google search box
  com.google.android.music                                    # Youtube Music
  com.google.android.videos                                   # Google Play Movies & TV
  com.google.android.youtube.music                            # Youtube Music
  com.android.chrome                                          # Google Chrome
  com.sec.android.app.chromecustomizations                    # Google Chrome customizations
  com.google.android.feedback                                 # Feedback
  com.google.android.gm                                       # Gmail
  com.google.android.talk                                     # Hangouts
  com.google.android.tts                                      # Google text to speech

  # ANT+ Service apps
  com.dsi.ant.plugins.antplus
  com.dsi.ant.sample.acquirechannels
  com.dsi.ant.server
  com.dsi.ant.service.socket

  # Netflix
  com.netflix.partner.activation
  com.netflix.mediaclient

  # Twitter
  com.twitter.android
)

for app in ${apps[@]}
do
    echo "Removing ${app} ..."
    adb shell pm uninstall --user 0 $app
done

echo "Done!"

echo "To reinstall any accidentally uninstalled packages run 'adb shell pm install-existing <package_name>'"
