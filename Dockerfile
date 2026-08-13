FROM archlinux

# Installing all pacman packages
RUN pacman -Syu --noconfirm && \
  pacman -S zsh neovim tmux git base-devel stow waybar kitty hyprshot swappy hyprpaper hyprlock hypridle --noconfirm;

# TODO: actually install yay in this image
# Run those commands to install yay and the used packages
# RUN git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# RUN yay -S walker elephant elephant-desktopapplications elephant-menus elephant-providerlist elephant-unicode --noconfirm

# Configuring git
RUN git config --global user.name "Gabriel C. Brandão" && \
  git config --global user.email "biel.brandao2004@gmail.com" && \
  git config --global core.editor nvim && \
  git config --global rerere.enabled true && \
  git config --global init.defaultbranch main;

RUN chsh -s /bin/zsh
ENV ZSH=/root/.oh-my-zsh

WORKDIR /root

COPY ./src .

RUN stow . -t ~ --adopt

# Install oh-my-zsh
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH

# Install zsh autosuggestions and syntax highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/custom/plugins/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting

RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH/custom/themes/powerlevel10k"

# Install Tmux tpm
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
  ~/.tmux/plugins/tpm/bin/install_plugins

ENTRYPOINT ["/bin/zsh"]
