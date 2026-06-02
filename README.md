# curriculum

Senior Backend Engineer with 8+ years building scalable REST APIs and distributed systems across ad-tech, HR-tech, and e-commerce. Deep expertise in Python/Django; growing proficiency in Java/SpringBoot. Proven record leading features in high-growth, fully remote SaaS products.

Single-page CV — visit [https://jg-valdes.github.io/curriculum/](https://jg-valdes.github.io/curriculum/)

## Generating the PDF (LaTeX)

The source is `cv.tex`. A build script is provided that compiles it via Docker so no local LaTeX installation is needed.

**Requirement:** Docker must be running.

```bash
bash build.sh
```

The script:
1. Copies `cv.tex` into a temporary directory owned by the current user.
2. Runs `pdflatex` inside the `texlive/texlive` Docker image with your user ID, so all build artifacts stay user-owned.
3. Copies the resulting `cv.pdf` to `assets/resources/cv.pdf` and cleans up the temp directory.

> **Why not run Docker directly?**
> Docker mounts volumes as root by default. Running `pdflatex` directly against the repo directory creates root-owned `.aux`/`.log`/`.out` files that block future user-owned runs. The script avoids this by compiling in an isolated temp directory.
