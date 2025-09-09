#!/bin/bash
# Revanced build
source ./src/build/utils.sh
# Download requirements
revanced_dl(){
	dl_gh "revanced-patches" "revanced" "prerelease"
 	dl_gh "revanced-cli" "revanced" "latest"
}
1() {
	revanced_dl
	# # Patch YouTube:
	# get_patches_key "youtube-revanced"
	# get_apk "com.google.android.youtube" "youtube-beta" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
	# split_editor "youtube-beta" "youtube-beta"
	# patch "youtube-beta" "revanced"
	# # Patch Youtube Arm64-v8a
	get_patches_key "youtube-revanced" 
	split_editor "youtube-beta" "youtube-beta-arm64-v8a" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64"
	patch "youtube-beta-arm64-v8a" "revanced"
 }
	
2() {
	revanced_dl
	# Patch Google photos:
	# Arm64-v8a
	get_patches_key "gg-photos"
	get_apk "com.google.android.apps.photos" "gg-photos-arm64-v8a-beta" "photos" "google-inc/photos/google-photos" "arm64-v8a" "nodpi"
	patch "gg-photos-arm64-v8a-beta" "revanced"
 }
	
3() {
	revanced_dl
	# Patch Instagram:
	# Arm64-v8a
	get_patches_key "instagram"
	get_apkpure "com.instagram.android" "instagram-arm64-v8a-beta" "instagram-android/com.instagram.android" "Bundle"
	patch "instagram-arm64-v8a-beta" "revanced"
}
4() {
	revanced_dl
	# Patch Lightroom:
	get_patches_key "lightroom"
 	url="https://adobe-lightroom-mobile.en.uptodown.com/android/download/1033600808" #Use uptodown because apkmirror always ask pass Cloudflare on this app
	url="https://dw.uptodown.com/dwn/$(req "$url" - | $pup -p --charset utf-8 'button#detail-download-button attr{data-url}')"
	req "$url" "lightroom-beta.apk"
	patch "lightroom-beta" "revanced"
	
}
5() {
	revanced_dl
	get_apk "com.google.android.youtube" "youtube-lite-beta" "youtube" "google-inc/youtube/youtube" "Bundle_extract"
	# Patch YouTube Lite Arm64-v8a:
	get_patches_key "youtube-revanced"
	split_editor "youtube-lite-beta" "youtube-lite-beta-arm64-v8a" "include" "split_config.arm64_v8a split_config.en split_config.xxxhdpi"
	patch "youtube-lite-beta-arm64-v8a" "revanced"
	
}
6() {
	revanced_dl
	# Patch YouTube Music:
	# Arm64-v8a
	get_patches_key "youtube-music-revanced"
	get_apk "com.google.android.apps.youtube.music" "youtube-music-beta-arm64-v8a" "youtube-music" "google-inc/youtube-music/youtube-music" "arm64-v8a"
	patch "youtube-music-beta-arm64-v8a" "revanced"
	
}
7() {
	revanced_dl
	# Patch Spotjfy Arm64-v8a
	get_patches_key "Spotjfy-revanced"
	j="i"
 	version="9.0.64.107" #https://github.com/ReVanced/revanced-patches/issues/5537#issuecomment-3134402120
	get_apkpure "com.spot"$j"fy.music" "spotjfy-beta-arm64-v8a" "spot"$j"fy-music-and-podcasts-for-android/com.spot"$j"fy.music"
	patch "spotjfy-beta-arm64-v8a" "revanced"
}
case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
    3)
        3
        ;;
    4)
        4
        ;;
    5)
        5
        ;;
    6)
        6
        ;;
    7)
        7
        ;;
esac
