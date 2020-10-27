# flutter_rev
this repo hosts some of my first flutter projects
which mostly consists of tangled spaghetti code generating ugly and horrible ui

still if you want to try out the apps, you can download (android releases) from below
if you want to build them yourself, instructions are at the bottom

[all releases](https://github.com/tshrpl/flutter_rev/releases)


## build instructions

#### dependencies
- flutter (with atleast android toolchain)
- linux (not really)

clone the code:
```bash
git clone https://github.com/tshrpl/flutter_rev
cd flutter_rev && git checkout dart_code
```

create a new flutter app and replace anything which is present in my project

example:
```bash
flutter create flutter_fun && cd flutter_fun
rm -r lib pubspec.yml
cp -r ../1_flutter_fundamentals/* . # replaces the new lib folder and pubspec.yml with mine
```

update project and build
```bash
flutter pub get
flutter build apk
```

