import json
import zipfile
import pathlib

source = pathlib.Path("src")

with open(source / "info.json") as file:
	info = json.load(file)

folder_name = f"{info['name']}_{info['version']}"
zip_path = pathlib.Path(f"{folder_name}.zip")

with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as archive:
	for file in source.rglob("*"):
		if file.is_file():
			archive.write(file, pathlib.Path(folder_name) / file.relative_to(source))

print(f"Created {zip_path}")
