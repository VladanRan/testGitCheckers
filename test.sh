set -eo pipefail

EXIT_STATUS=0

. .OClintExampleApp/scripts/check_secrets.sh
check_secrets

if [[ "$have_secrets" == true ]]; then
    (xcodebuild \
      -workspace /Users/vladan.randjelovic/Desktop/testGitCheckers/OClintExampleApp/OClintExampleApp.xcworkspace \
      -scheme OClintExampleApp \
      -sdk iphonesimulator \
      -destination 'platform=iOS Simulator,name=iPhone 11' \
      build \
      test \
      ONLY_ACTIVE_ARCH=YES \
      | xcpretty) || EXIT_STATUS=$?
else
    # Skip running tests if GoogleService-Info.plist's weren't decoded.
    (xcodebuild \
      -workspace /Users/vladan.randjelovic/Desktop/testGitCheckers/OClintExampleApp/OClintExampleApp.xcworkspace \
      -scheme OClintExampleApp \
      -sdk iphonesimulator \
      -destination 'platform=iOS Simulator,name=iPhone 11' \
      build \
      ONLY_ACTIVE_ARCH=YES \
      | xcpretty) || EXIT_STATUS=$?
fi

  exit $EXIT_STATUS