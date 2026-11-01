# RG350M-SYS

Eigene Firmware für das Anbernic RG350M, basierend auf dem aktuellen
OpenDingux-Buildroot (Linux 6.8, Mesa/etnaviv), mit:

- **EmulationStation** (RetroPie, GLES2-Renderer, ohne libVLC) als Frontend
- **RetroArch** 1.22.2 (offizielles OpenDingux-Beta-Target, IPU-Skalierung)
- **32 libretro-Cores**, ausgewählt nach dem, was auf dem JZ4770 (1 GHz MIPS) flüssig läuft
- **HDMI-Ausgang** mit automatischem Umschalten beim Einstecken
- GMenu2X bleibt für OPK-Apps erreichbar (ES → Tools)

## Bauen

```sh
./build.sh            # komplettes Image bauen (dauert beim ersten Mal mehrere Stunden)
./build.sh clean      # alles neu
./build.sh <paket>-rebuild   # einzelnes Paket neu bauen, z. B. emulationstation-rebuild
```

Ergebnis: `output/images/rg350m-sys.img` (und `.img.xz`).

Flashen auf die **interne Karte (TF1)**, z. B. mit balenaEtcher oder:

```sh
sudo dd if=output/images/rg350m-sys.img of=/dev/sdX bs=4M conv=fsync status=progress
```

Beim ersten Start wird die Datenpartition auf die volle Kartengröße erweitert.

## ROMs

- Zweite SD-Karte (TF2, FAT32/exFAT): Ordner `roms/<system>/`. Wird bevorzugt, wenn vorhanden.
- Sonst intern unter `/media/data/roms/<system>/` (per USB-MTP oder SSH befüllbar).
- BIOS-Dateien: `/media/data/bios/`

| Ordner | System | Core |
|---|---|---|
| nes, fds | NES / Famicom Disk System | fceumm (nestopia installiert) |
| snes | Super Nintendo | snes9x2005 (snes9x2002 installiert) |
| gb, gbc | Game Boy / Color | gambatte |
| gba | Game Boy Advance | gpsp (MIPS-Dynarec) |
| megadrive, mastersystem, gamegear, segacd, sega32x | Sega | picodrive |
| sg-1000 | Sega SG-1000 | genesis_plus_gx |
| pcengine, pce-cd | PC Engine | mednafen_pce_fast |
| psx | PlayStation | pcsx_rearmed (Lightrec-Dynarec) |
| ngp, ngpc | Neo Geo Pocket | race |
| wonderswan, wonderswancolor | WonderSwan | mednafen_wswan |
| atarilynx, atari2600, atari5200, atari7800, atari800 | Atari | handy, stella2014, atari800, prosystem |
| vectrex | Vectrex | vecx |
| colecovision, msx | ColecoVision / MSX | bluemsx |
| zxspectrum, amstradcpc | ZX Spectrum / CPC | fuse, cap32 |
| fba, neogeo | Arcade (FBA 2012) | fbalpha2012 |
| mame | Arcade (MAME 2003-Plus) | mame2003_plus |
| pokemini, gameandwatch, videopac, intellivision, supervision | diverse | pokemini, gw, o2em, freeintv, potator |
| amiga | Commodore Amiga (Kickstart `kick34005.A500` nach `bios/`) | puae2021 |
| c64 | Commodore 64 | vice_x64 |
| pico8 | PICO-8 (`.p8` / `.p8.png`-Carts) | fake08 |
| doom | DOOM (WAD) | prboom |

Welche Systeme/Cores es gibt, steht in
`external/board/rg350m/overlay/usr/share/rg350m/systems.tsv`. Eine Zeile mehr
dort ergibt ein neues System in EmulationStation.

**Nicht dabei:** N64, Nintendo DS, PSP, Dreamcast, Saturn. Dafür ist der JZ4770 zu langsam.

## Tasten in RetroArch

SELECT gedrückt halten plus:

| Taste | Funktion |
|---|---|
| START | Spiel beenden, zurück zu EmulationStation |
| X | RetroArch-Menü |
| R1 / L1 | Savestate speichern / laden |
| R2 | Vorspulen |

Notausgang aus jedem Programm: **Power + Select** (pwswd „kill“).

## HDMI

Kabel einstecken: Das Panel geht aus, EmulationStation startet auf dem HDMI-Ausgang
neu. Läuft gerade ein Spiel, wechselt das Bild nach Rückkehr ins Menü. Kabel
ziehen schaltet zurück aufs Panel. Unter *Tools → HDMI - toggle auto switching*
lässt sich das automatische Umschalten abschalten.

Einschränkung: Der Ton bleibt auf Lautsprecher/Kopfhörer. HDMI-Audio ist im
Devicetree nicht verdrahtet und auf echter Hardware noch nicht getestet.

## Aufbau

```
buildroot/                 OpenDingux-Buildroot (unverändert)
external/                  BR2_EXTERNAL "RG350M_SYS"
  configs/rg350m_sys.fragment   Ergänzungen zu od_gcw0_defconfig
  package/emulationstation/     + Patch: libVLC optional
  package/retroarch/
  package/es-theme-carbon/
  package/libretro-*/           ein Paket pro Core (gemeinsames Makro in external.mk)
  board/rg350m/
    overlay/                    Frontend-Skripte, HDMI-Hotplug, Configs
    post-build.sh, post-image.sh   SD-Karten-Image (genimage)
build.sh
```

## Klonen

Buildroot ist als Submodul eingebunden (OpenDingux, festgepinnt):

```sh
git clone --recurse-submodules https://github.com/bonbon08/rg350m-sys.git
```
