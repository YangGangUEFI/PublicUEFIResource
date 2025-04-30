#### Dependency

1. VS2022 with C/C++ development for Desktop
2. CMAKE
3. https://github.com/LongSoft/qt-6-static-x64-msvc2022

#### Steps to build(win64 static QT)

1. Download [qt-6-static-x64-msvc2022](https://github.com/LongSoft/qt-6-static-x64-msvc2022) and extract it ./[UEFITool-source-root]/build/qt6/
   ```
    └─qt6
       └─qt-6.5.0-static-x64-msvc2022
           ├── bin
           ├── doc
           ├── include
           ├── lib
           ├── metatypes
           ├── mkspecs
           ├── modules
           ├── plugins
           └── config.opt
   ```
2. py -3 .\build_uefitool_win64_static.py
