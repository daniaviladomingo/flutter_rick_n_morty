cd domain && dart run build_runner build --delete-conflicting-outputs && cd ..
cd data && dart run build_runner build --delete-conflicting-outputs && cd ..
dart run build_runner build --delete-conflicting-outputs

