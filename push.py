import os
import subprocess

repo_path = "/storage/emulated/0/Documents/EuropaLauncher/github/europa-mobile-cfg/"

commitMessage = str(input("Commit Message:\n-> "))

subprocess.run(["git", "add", "-A"], cwd=repo_path)
subprocess.run(["git", "commit", "-m", commitMessage], cwd=repo_path)

type = int(input("force? | 0 no / 1 yes;\n-> "))
if type == 0:
    subprocess.run(["git", "push", "origin", "main"], cwd=repo_path)
elif type == 1:
    subprocess.run(["git", "push", "origin", "main", "--force"], cwd=repo_path)
else:
    print("inv")