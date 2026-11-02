# LaTeX Dev Container Template

Template proyek LaTeX siap pakai dengan lingkungan terisolasi **VS Code Dev Containers** (TeX Live Full) dan **Makefile** untuk kemudahan kompilasi.

## Fitur Utama

- **TeX Live Full:** Menggunakan image Docker `ghcr.io/xu-cheng/texlive-full` yang mencakup seluruh paket CTAN, `latexmk`, `biber`, `texcount`, dan `chktex`.
- **VS Code Preconfigured:** Extension *LaTeX Workshop* dan *Code Spell Checker* terpasang otomatis beserta pengaturan auto-build dan internal PDF viewer.
- **Makefile Lengkap:** Menyediakan shortcut perintah untuk build, live auto-recompile (`watch`), wordcount, linting, dan pembersihan file sementara.
- **IEEEtran & BibTeX Ready:** Dilengkapi contoh sitasi dan file referensi `references.bib`.

---

## Cara Menggunakan

### 1. Menggunakan GitHub CLI (Paling Cepat)
Jalankan perintah ini di terminal:
```bash
gh repo create nama-project-anda --template oktavsm/latex-devcontainer-template --clone
cd nama-project-anda
code .
```

### 2. Menggunakan Tombol Template GitHub
1. Klik tombol hijau **Use this template** di pojok kanan atas halaman repository ini.
2. Pilih **Create a new repository**.
3. Clone repository baru Anda ke komputer lokal dan buka di VS Code:
   ```bash
   code nama-project-anda
   ```

### 3. Masuk ke Dev Container
Ketika VS Code terbuka, klik notifikasi:
> **"Reopen in Container"**

*(Atau buka Command Palette dengan `Ctrl+Shift+P` lalu pilih `Dev Containers: Reopen in Container`)*.

---

## Perintah Makefile

Buka terminal (bisa langsung di dalam VS Code terminal atau Dev Container) dan gunakan shortcut berikut:

| Perintah | Keterangan |
| :--- | :--- |
| `make` / `make pdf` | Mengompilasi dokumen `main.tex` menjadi `main.pdf` |
| `make watch` | Mode *continuous compilation* (otomatis recompile setiap kali file disimpan) |
| `make count` | Menghitung jumlah kata dan statistik dokumen menggunakan `texcount` |
| `make lint` | Memeriksa kesalahan sintaks dan tipografi dengan `chktex` |
| `make clean` | Menghapus file-file pembantu (`.aux`, `.log`, `.toc`, dll) tanpa menghapus PDF |
| `make distclean` | Menghapus semua file hasil build termasuk `main.pdf` |
| `make help` | Menampilkan panduan ringkas seluruh perintah |

---

## Struktur Direktori

```text
.
├── .devcontainer/
│   └── devcontainer.json   # Konfigurasi Docker image & VS Code extensions
├── .gitignore              # Mengabaikan file build sementara LaTeX
├── Makefile                # Command automation (build, watch, count, lint, clean)
├── README.md
├── main.tex                # Template dokumen utama
└── references.bib          # Database sitasi BibTeX
```
