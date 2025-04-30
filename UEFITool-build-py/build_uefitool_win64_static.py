import os
import subprocess
import zipfile


SOURCE_DIR = os.path.abspath("UEFITool")
BUILD_DIR = os.path.join(SOURCE_DIR, "build")
DIST_DIR = os.path.join(SOURCE_DIR, "dist")
QT_PATH = os.path.join(SOURCE_DIR, "qt6", "qt-6.5.0-static-x64-msvc2022")

os.makedirs(BUILD_DIR, exist_ok=True)
os.makedirs(DIST_DIR, exist_ok=True)

def run_cmd(cmd, cwd=None, shell=True):
    print(f"Running: {cmd}")
    subprocess.run(cmd, cwd=cwd, shell=shell, check=True)

def zip_file(zip_name, file_path):
    with zipfile.ZipFile(zip_name, 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipf.write(file_path, arcname=os.path.basename(file_path))

# 1. Configure with CMake
run_cmd(f'cmake -DCMAKE_PREFIX_PATH="{QT_PATH}" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded -A x64 {SOURCE_DIR}', cwd=BUILD_DIR)

# 2. Build
run_cmd('cmake --build . --config Release', cwd=BUILD_DIR)

# 3. Get version from version.h
version_h_path = os.path.join(SOURCE_DIR, "version.h")
with open(version_h_path, 'r') as f:
    for line in f:
        if "PROGRAM_VERSION" in line:
            version = line.split('"')[1].replace("NE alpha ", "A")

# 4. Archive
exe_names = ["UEFITool", "UEFIExtract", "UEFIFind"]
for exe in exe_names:
    exe_path = os.path.join(BUILD_DIR, exe, "Release", f"{exe}.exe")
    zip_path = os.path.join(DIST_DIR, f"{exe}_NE_{version}_win64.zip")
    zip_file(zip_path, exe_path)

print("Build and packaging completed.")
