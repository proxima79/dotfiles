#!/bin/bash
# Catppuccin Mocha Color Palette
# Usage: source ~/.config/catppuccin/mocha.sh

# Base colors
export CATPPUCCIN_ROSEWATER="#f5e0dc"
export CATPPUCCIN_FLAMINGO="#f2cdcd"
export CATPPUCCIN_PINK="#f5c2e7"
export CATPPUCCIN_MAUVE="#cba6f7"
export CATPPUCCIN_RED="#f38ba8"
export CATPPUCCIN_MAROON="#eba0ac"
export CATPPUCCIN_PEACH="#fab387"
export CATPPUCCIN_YELLOW="#f9e2af"
export CATPPUCCIN_GREEN="#a6e3a1"
export CATPPUCCIN_TEAL="#94e2d5"
export CATPPUCCIN_SKY="#89dceb"
export CATPPUCCIN_SAPPHIRE="#74c7ec"
export CATPPUCCIN_BLUE="#89b4fa"
export CATPPUCCIN_LAVENDER="#b4befe"

# Surface colors
export CATPPUCCIN_TEXT="#cdd6f4"
export CATPPUCCIN_SUBTEXT1="#bac2de"
export CATPPUCCIN_SUBTEXT0="#a6adc8"
export CATPPUCCIN_OVERLAY2="#9399b2"
export CATPPUCCIN_OVERLAY1="#7f849c"
export CATPPUCCIN_OVERLAY0="#6c7086"
export CATPPUCCIN_SURFACE2="#585b70"
export CATPPUCCIN_SURFACE1="#45475a"
export CATPPUCCIN_SURFACE0="#313244"
export CATPPUCCIN_BASE="#1e1e2e"
export CATPPUCCIN_MANTLE="#181825"
export CATPPUCCIN_CRUST="#11111b"

# Set LS_COLORS for colorized ls output
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

# Function to apply Catppuccin colors to current session
catppuccin_apply() {
    # Set terminal colors if supported
    if [[ "$COLORTERM" == "truecolor" ]] || [[ "$TERM" == *"256color"* ]]; then
        # Set cursor color
        printf '\e]12;%s\007' "$CATPPUCCIN_ROSEWATER"
        
        # Set selection background
        printf '\e]17;%s\007' "$CATPPUCCIN_SURFACE0"
        
        # Set selection foreground
        printf '\e]19;%s\007' "$CATPPUCCIN_TEXT"
    fi
}

# Function to show Catppuccin color palette
catppuccin_show() {
    echo "🌸 Catppuccin Mocha Color Palette"
    echo ""
    printf "\e[38;2;245;224;220m██\e[0m Rosewater  %s\n" "$CATPPUCCIN_ROSEWATER"
    printf "\e[38;2;242;205;205m██\e[0m Flamingo   %s\n" "$CATPPUCCIN_FLAMINGO"
    printf "\e[38;2;245;194;231m██\e[0m Pink       %s\n" "$CATPPUCCIN_PINK"
    printf "\e[38;2;203;166;247m██\e[0m Mauve      %s\n" "$CATPPUCCIN_MAUVE"
    printf "\e[38;2;243;139;168m██\e[0m Red        %s\n" "$CATPPUCCIN_RED"
    printf "\e[38;2;235;160;172m██\e[0m Maroon     %s\n" "$CATPPUCCIN_MAROON"
    printf "\e[38;2;250;179;135m██\e[0m Peach      %s\n" "$CATPPUCCIN_PEACH"
    printf "\e[38;2;249;226;175m██\e[0m Yellow     %s\n" "$CATPPUCCIN_YELLOW"
    printf "\e[38;2;166;227;161m██\e[0m Green      %s\n" "$CATPPUCCIN_GREEN"
    printf "\e[38;2;148;226;213m██\e[0m Teal       %s\n" "$CATPPUCCIN_TEAL"
    printf "\e[38;2;137;220;235m██\e[0m Sky        %s\n" "$CATPPUCCIN_SKY"
    printf "\e[38;2;116;199;236m██\e[0m Sapphire   %s\n" "$CATPPUCCIN_SAPPHIRE"
    printf "\e[38;2;137;180;250m██\e[0m Blue       %s\n" "$CATPPUCCIN_BLUE"
    printf "\e[38;2;180;190;254m██\e[0m Lavender   %s\n" "$CATPPUCCIN_LAVENDER"
    echo ""
    printf "\e[38;2;205;214;244m██\e[0m Text       %s\n" "$CATPPUCCIN_TEXT"
    printf "\e[38;2;186;194;222m██\e[0m Subtext1   %s\n" "$CATPPUCCIN_SUBTEXT1"
    printf "\e[38;2;166;173;200m██\e[0m Subtext0   %s\n" "$CATPPUCCIN_SUBTEXT0"
    printf "\e[38;2;147;153;178m██\e[0m Overlay2   %s\n" "$CATPPUCCIN_OVERLAY2"
    printf "\e[38;2;127;132;156m██\e[0m Overlay1   %s\n" "$CATPPUCCIN_OVERLAY1"
    printf "\e[38;2;108;112;134m██\e[0m Overlay0   %s\n" "$CATPPUCCIN_OVERLAY0"
    printf "\e[38;2;88;91;112m██\e[0m Surface2   %s\n" "$CATPPUCCIN_SURFACE2"
    printf "\e[38;2;69;71;90m██\e[0m Surface1   %s\n" "$CATPPUCCIN_SURFACE1"
    printf "\e[38;2;49;50;68m██\e[0m Surface0   %s\n" "$CATPPUCCIN_SURFACE0"
    printf "\e[38;2;30;30;46m██\e[0m Base       %s\n" "$CATPPUCCIN_BASE"
    printf "\e[38;2;24;24;37m██\e[0m Mantle     %s\n" "$CATPPUCCIN_MANTLE"
    printf "\e[38;2;17;17;27m██\e[0m Crust      %s\n" "$CATPPUCCIN_CRUST"
    echo ""
}

# Auto-apply colors when sourced
catppuccin_apply

