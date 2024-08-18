name:

Flutter CI
/
CD

on:push:branches:-
main
pull_request:branches:-
main
workflow_dispatch:

jobs:build:runs-on: ubuntu-latest

steps:-
name:

Checkout repository
uses: actions/checkout
@v3

- name:

Set up
Flutter
uses: subosito/flutter-action
@v2with:
flutter-version: '
stable
'

-
name:

Install dependencies
run:

flutter pub
get

- name:

Run tests
run:

flutter test

-
name:

Build APK
run:

flutter build
apk --release

- name:

Upload APK
uses: actions/upload-artifact
@v3with:
name: app-release.apk
path: build/app/outputs/flutter-apk/app-release.apk

release:needs:

build
runs
-
on: ubuntu-latest
steps:-
name:

Download APK

from build
job
uses: actions/download-artifact
@v3with:
name: app-release.apk

- name:

Create GitHub
Release
id: create_release
uses: actions/create-release
@v1
env:GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
with
:
tag_name: 'v1.0.${{ github.run_number }}
'
release_name: 'GitHub Repositories Viewer v1.0.${{ github.run_number }}
'
draft: false
prerelease: false

-
name:

Upload APK

to Release
uses: actions/upload-release-asset
@v1
env:GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
with
:
upload_url: ${{ steps.create_release.outputs.upload_url }}
asset_path: build/app/outputs/flutter-apk/app-release.apk
asset_name: app-release.apk
asset_content_type: application/vnd.android.package-archive
