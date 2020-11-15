import ../devel/nix-profile-declarative/nix-profile {
  configuration = { pkgs, ... }: {
    nixpkgs = {
      config = {
        allowUnfree = true;
      };

      overlays = [
        (import (fetchTarball {
          url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
        }))
        (import ./pkgs/overlay.nix)
      ];
    };
    
    programs.emacs = {
      enable = true;
      quick = true;
      config = ./emacs.d;

      emacsPackages = ep: with ep; [
        # Theme
        doom-themes

        # QoL
        dashboard page-break-lines
      
        # Major modes
        nix-mode haskell-mode yaml-mode
        markdown-mode lua-mode

        # Util
        magit deadgrep use-package hydra
        ryo-modal alert pinentry

        # Zettelkasten
        deft
      ];

      runtimeDependencies = with pkgs; [
        imagemagickBig ispell
      ];
    };

    profilePackages = with pkgs; [
      # GUI
      steam lutris flameshot
      transmission-gtk calibre xournal
      krita mpv obs-studio wasabiwallet
      zoom-us

      # Language Learning
      chromium anki substudy

      # CLI
      ffmpeg-full htop steam-run
      libstrangle p7zip unar ripgrep
      tree wget youtube-dl

      gitAndTools.gitFull

      # Haskell
      cabal-install
    ];
  };
}
