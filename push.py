import os
commitMessage = str(input("Commit Message;\n-> "))
os.system("git add -A")
os.system("git commit -m '" + commitMessage + "'")
type = int(input("force? | 0 no / 1 yes;\n-> "))
if type == 0:
 os.system("git push origin main")
elif type == 1:
 os.system("git push origin main --force")
else:
 print("inv")