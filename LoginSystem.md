prithul-jaiswal@prithul-jaiswal-GL613:~/scripts$ mkdir loginsystem

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts$ git add loginsystem/

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git checkout -b feature/login-system
Switched to a new branch 'feature/login-system'

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ echo "1st line content" > login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git add login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git commit -m "A: Base featuresetup and project scaffolding"

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ echo "2nd line content" >> login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git add login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git commit -m "B: Added UI components for login"

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ echo "3rd line content" >> login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git add login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git commit -m  "C: Implemented backend API integration"

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ echo "4th line content" >> login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git add login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git commit -m "D: Added form validation and error handling"

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ echo "5th line content" >> login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git add login.txt

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git commit -m "  E: Minor bug fix and styling tweaks"

prithul-jaiswal@prithul-jaiswal-GL613:~/scripts/loginsystem$ git log
commit f798ad373fc37ff71ab37ef0c2a8e354beda1b8e (HEAD -> feature/login-system)
Author: Prithul Jaiswal <prithuljaiswal99@gmail.com>
Date:   Mon Sep 29 13:52:01 2025 +0530

      E: Minor bug fix and styling tweaks

commit 895e19cfa3203bcfe64d320b97bdeabd2540f66f
Author: Prithul Jaiswal <prithuljaiswal99@gmail.com>
Date:   Mon Sep 29 13:50:54 2025 +0530

    D: Added form validation and error handling

commit 574adc703b13af0470e0dcf572045dc824d5eee3
Author: Prithul Jaiswal <prithuljaiswal99@gmail.com>
Date:   Mon Sep 29 13:50:07 2025 +0530

    C: Implemented backend API integration

commit 7b1bd86a9c7ad0821315687b8ba2d151ade3f416
Author: Prithul Jaiswal <prithuljaiswal99@gmail.com>
Date:   Mon Sep 29 13:49:21 2025 +0530

    B: Added UI components for login

commit a89dca5c245d6004784c93cdb4648901fab93335
Author: Prithul Jaiswal <prithuljaiswal99@gmail.com>
Date:   Mon Sep 29 13:48:57 2025 +0530

    A: Base feature setup and project scaffolding

1.
git revert 895e19cfa3203bcfe64d320b97bdeabd2540f66f
2.
git reset --soft HEAD~1
3.
git reset --mixed HEAD~2
4.
git reset --hard 7b1bd86a9c7ad0821315687b8ba2d151ade3f416

