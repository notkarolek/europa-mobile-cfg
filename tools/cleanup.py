import os

youSureTwin = str(input("you sure? | y/n;\n-> "))
if youSureTwin == "y":
 print("removing .git...")
 os.system("rm -rf .git")
 print("initalizing branch...")
 os.system("git init && git branch -m main")
 print("adding content...")
 os.system("git add -A")
 commitMessage = str(input("commit message;\n-> "))
 os.system("git commit -m '" + commitMessage + "'")
 print("adding origin...")
 os.system("git remote add origin https://github.com/notkarolek/europa-mobile-cfg")
 print("pushing...")
 os.system("git push origin main --force")
 print("finished")
else:
 pass