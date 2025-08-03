#################
# if OS.mac?
#   # macos stuff
# elsif OS.linux?
#   # linux stuff
# end
#################

# formulae
brew 'acronym'                        # Python-based tool for creating English-ish acronyms from your fancy project
brew 'autoconf'                       # Automatic configure script builder
brew 'automake'                       # Tool for generating GNU Standards-compliant Makefiles
brew 'awk'                            # Text processing scripting language
brew 'awscli'                         # Official Amazon AWS command-line interface
brew 'bash'                           # Bourne-Again SHell, a UNIX command interpreter
brew 'bash-completion@2'              # Programmable completion for Bash 4.2+
brew 'bat'                            # Clone of cat(1) with syntax highlighting and Git integration
brew 'bat-extras'                     # Bash scripts that integrate bat with various command-line tools
brew 'biome'                          # Toolchain of the web
brew 'brotli'                         # Generic-purpose lossless compression algorithm by Google
brew 'bruno-cli'                      # CLI of the open-source IDE For exploring and testing APIs
brew 'c3c'                            # Compiler for the C3 language
brew 'ca-certificates'                # Mozilla CA certificate store
brew 'caddy'                          # Powerful, enterprise-ready, open source web server with automatic HTTPS
brew 'certbot'                        # Tool to obtain certs from Let's Encrypt and autoenable HTTPS
brew 'cloudflared'                    # Cloudflare Tunnel client
brew 'cmake'                          # Cross-platform make
brew 'coreutils'                      # GNU File, Shell, and Text utilities
brew 'ctop'                           # Top-like interface for container metrics
brew 'curl'                           # Get a file from an HTTP, HTTPS or FTP server
brew 'deno'                           # Secure runtime for JavaScript and TypeScript
brew 'devcontainer'                   # Reference implementation for the Development Containers specification
brew 'dnsmasq'                        # Lightweight DNS forwarder and DHCP server
brew 'docker'                         # Pack, ship and run any application as a lightweight container
brew 'docker-completion'              # Bash, Zsh and Fish completion for Docker
brew 'docker-compose'                 # Isolated development environments using Docker
brew 'dungeon'                        # Classic text adventure game
brew 'editorconfig'                   # Maintain consistent coding style between multiple editors
brew 'esbuild'                        # Extremely fast JavaScript bundler and minifier
brew 'eslint'                         # AST-based pattern checker for JavaScript
brew 'exif'                           # Read, write, modify, and display EXIF data on the command-line
brew 'ffmpeg'                         # Play, record, convert, and stream audio and video
brew 'findutils'                      # Collection of GNU find, xargs, and locate
brew 'flac'                           # Free lossless audio codec
brew 'fzf'                            # Command-line fuzzy finder written in Go
brew 'gcc'                            # GNU compiler collection
brew 'gettext'                        # GNU internationalization (i18n) and localization (l10n) library
brew 'gh'                             # GitHub command-line tool
brew 'git'                            # Distributed revision control system
brew 'git-extras'                     # Small git utilities
brew 'git-flow'                       # Extensions to follow Vincent Driessen's branching model
brew 'git-lfs'                        # Git extension for versioning large files
brew 'git-quick-stats'                # Simple and efficient way to access statistics in git
brew 'gitleaks'                       # Audit git repos for secrets
brew 'gleam'                          # Statically typed language for the Erlang VM
brew 'gnupg'                          # GNU Pretty Good Privacy (PGP) package
brew 'go'                             # Open source programming language to build simple/reliable/efficient software
brew 'gzip'                           # Popular GNU data compression program
brew 'htop'                           # Improved top (interactive process viewer)
brew 'httpie'                         # User-friendly cURL replacement (command-line HTTP client)
brew 'icann-rdap'                     # Full-rich client for the Registry Data Access Protocol (RDAP) sponsored by ICANN
brew 'imagemagick'                    # Tools and libraries to manipulate images in many formats
if OS.mac?
  brew 'imagesnap'                    # Tool to capture still images from an iSight or other video source
end
brew 'invoice'                        # Command-line invoice generator
brew 'jpeg-turbo'                     # JPEG image codec that aids compression and decompression
brew 'jpeg-xl'                        # New file format for still image compression
brew 'jq'                             # Lightweight and flexible command-line JSON processor
brew 'libtool'                        # Generic library support script
brew 'llvm'                           # Next-gen compiler infrastructure
brew 'make'                           # Utility for directing compilation
brew 'mas'                            # Mac App Store command-line interface
brew 'mkcert'                         # Simple tool to make locally trusted development certificates
brew 'nano'                           # Free (GNU) replacement for the Pico text editor
brew 'nmap'                           # Port scanning utility for large networks
brew 'ntfy'                           # Send push notifications to your phone or desktop via PUT/POST
brew 'nvm'                            # Manage multiple Node.js versions
brew 'openjpeg'                       # Library for JPEG-2000 image manipulation
brew 'openssl@3'                      # Cryptography and SSL/TLS Toolkit
brew 'pnpm'                           # Fast, disk space efficient package manager
brew 'proctools'                      # OpenBSD and Darwin versions of pgrep, pkill, and pfind
brew 'pstree'                         # Show ps output as a tree
brew 'sqlite'                         # Command-line interface for SQLite
brew 'python@3.13'                    # Interpreted, interactive, object-oriented programming language
brew 'stow'                           # Organize software neatly under a single directory tree (e.g. /usr/local)
brew 'tailwindcss'                    # Utility-first CSS framework
brew 'tcpdump'                        # Command-line packet analyzer
brew 'telnet'                         # User interface to the TELNET protocol
brew 'tmux'                           # Terminal multiplexer
brew 'unzip'                          # Extraction utility for .zip compressed archives
brew 'uv'                             # Extremely fast Python package installer and resolver, written in Rust
brew 'webp'                           # Image format providing lossless and lossy compression for web images
brew 'wget'                           # Internet file retriever
brew 'whois'                          # Lookup tool for domain names and other internet resources
brew 'xkcd'                           # Fetch latest, random or any particular xkcd comic right in your terminal
brew 'yt-dlp'                         # Feature-rich command-line audio/video downloader
brew 'zsh'                            # UNIX shell (command interpreter)
brew 'zsh-completions'                # Additional completion definitions for zsh
brew 'zsh-syntax-highlighting'        # Fish shell like syntax highlighting for zsh

# custom formulae
tap 'oven-sh/bun'
brew 'oven-sh/bun/bun'                # Incredibly fast JavaScript runtime, bundler, transpiler and package manager - all in one
tap 'sst/tap'
brew 'sst/tap/opencode'               # The AI coding agent built for the terminal

if OS.mac?
  # casks
  cask_args appdir: '/Applications', require_sha: true

  cask '1password'                    # "Password manager that keeps all passwords secure behind one password
  cask '1password-cli'                # Command-line interface for 1Password
  cask 'betterdisplay'                # Display management tool
  cask 'brewservicesmenubar'          # Menu item for starting and stopping homebrew services
  cask 'bruno'                        # Open source IDE for exploring and testing APIs
  cask 'calibre'                      # E-books management software
  cask 'canon-eos-utility'            # Communication with Canon EOS cameras
  cask 'cap'                          # Screen recording software
  cask 'chatgpt'                      # OpenAI's official ChatGPT desktop app
  cask 'charles'                      # Web debugging Proxy application
  cask 'chromedriver'                 # Automated testing of webapps for Google Chrome
  cask 'cursor'                       # Write, edit, and chat about your code with AI
  cask 'discord'                      # Voice and text chat software
  cask 'disk-inventory-x'             # Disk usage utility
  cask 'displaylink'                  # Drivers for DisplayLink docks, adapters and monitors
  cask 'epic-games'                   # Launcher for *Epic Games* games
  cask 'exifcleaner'                  # Metadata cleaner
  cask 'figma'                        # Collaborative team software
  cask 'firefox'                      # Web browser
  cask 'fliqlo'                       # Flip clock screensaver
  cask 'gitbutler'                    # Git client for simultaneous branches on top of your existing workflow
  cask 'github'                       # Desktop client for GitHub repositories
  cask 'gog-galaxy'                   # Game client
  cask 'gpg-suite'                    # Tools to protect your emails and files
  cask 'hammerspoon'                  # Desktop automation application
  cask 'hiddenbar'                    # Utility to hide menu bar items
  cask 'kap'                          # Open-source screen recorder built with web technology
  cask 'karabiner-elements'           # Keyboard customiser
  cask 'leader-key'                   # Application launcher
  cask 'lm-studio'                    # Discover, download, and run local LLMs
  cask 'maccy'                        # Clipboard manager
  cask 'macfuse'                      # File system integration
  cask 'microsoft-edge'               # Multi-platform web browser
  cask 'microsoft-teams'              # Meet, chat, call, and collaborate in just one place
  cask 'mitmproxy'                    # Intercept, modify, replay, save HTTP/S traffic
  cask 'mongodb-compass'              # Interactive tool for analyzing MongoDB data
  cask 'ngrok'                        # Reverse proxy, secure introspectable tunnels to localhost
  cask 'notion'                       # App to write, plan, collaborate, and get organised
  cask 'obs'                          # Open-source software for live streaming and screen recording
  cask 'obsidian'                     # Knowledge base that works on top of a local folder of plain text Markdown files
  cask 'ollama-app'                   # Get up and running with large language models locally
  cask 'openvpn-connect'              # Client program for the OpenVPN Access Server
  cask 'opera'                        # Web browser
  cask 'operadriver'                  # Web browser
  cask 'osquery'                      # SQL powered operating system instrumentation and analytics
  cask 'packetsender'                 # Network utility for sending / receiving TCP, UDP, SSL
  cask 'pgadmin4'                     # Administration and development platform for PostgreSQL
  cask 'pika'                         # Colour picker for colours onscreen
  cask 'postman'                      # Collaboration platform for API development
  cask 'powershell'                   # Command-line shell and scripting language
  cask 'proxyman'                     # HTTP debugging proxy
  cask 'qbittorrent'                  # Peer to peer Bitorrent client
  cask 'rapidapi'                     # HTTP client that helps testing and describing APIs"
  cask 'raycast'                      # Control your tools with a few keystrokes
  cask 'razorsql'                     # SQL query tool and SQL editor
  cask 'slack'                        # Team communication and collaboration software
  cask 'slack-cli'                    # CLI to create, run, and deploy Slack apps
  cask 'teamviewer'                   # Remote access and connectivity software focused on security
  cask 'telegram'                     # Messaging app with a focus on speed and security
  cask 'the-unarchiver'               # Unpacks archive files
  cask 'tor-browser'                  # Web browser focusing on security
  cask 'visual-studio-code'           # Open-source code editor
  cask 'visual-studio-code@insiders'  # Open-source code editor
  cask 'vivaldi'                      # Web browser with built-in email client focusing on customization and control
  cask 'vlc'                          # Multimedia player
  cask 'whatsapp'                     # Native desktop client for WhatsApp
  cask 'windsurf'                     # Agentic IDE powered by AI Flow paradigm
  cask 'wireshark'                    # Network protocol analyzer

  # quicklook casks
  cask 'gltfquicklook'                # Quick Look plugin for glTF files
  cask 'ipynb-quicklook'              # Quick Look plugin for Jupyter/IPython notebooks
  cask 'jupyter-notebook-ql'          # Quick Look plugin for Jupyter notebooks
  cask 'quicklook-csv'                # Quick Look plugin for CSV files
  cask 'quicklookase'                 # Quick Look generator for Adobe Swatch Exchange files
  cask 'qlcolorcode'                  # Quick Look plug-in that renders source code with syntax highlighting
  cask 'qlmarkdown'                   # Quick Look generator for Markdown files
  cask 'qlstephen'                    # Quick Look plugin for plaintext files without an extension
  cask 'qlvideo'                      # Thumbnails, static previews, cover art and metadata for video files
  cask 'qlzipinfo'                    # List out the contents of a zip file in the QuickLook preview
  cask 'syntax-highlight'             # Quicklook extension for source files

  # Error: Cask '<name>' does not have a sha256 checksum defined and was not installed.
  # This means you have the --require-sha option set, perhaps in your HOMEBREW_CASK_OPTS.
  cask_args appdir: '/Applications', require_sha: false

  cask 'google-chrome'                # Web browser
  cask 'google-chrome@beta'           # Web browser
  cask 'google-trends' #
  cask 'logi-options+'                # Software for Logitech devices
  cask 'miro'                         # Online collaborative whiteboard platform
  cask 'nvidia-geforce-now'           # Cloud gaming platform
  cask 'paragon-ntfs'                 # Read/write support for NTFS formatted volumes
  cask 'redis-insight'                # GUI for streamlined Redis application development
  cask 'retroarch'                    # Frontend for emulators, game engines and media players (OpenGL graphics API)
  cask 'spotify'                      # Music streaming service
  cask 'steam'                        # Video game digital distribution service
  cask 'steamcmd'                     # Command-line client for Steam

  cask 'quicklook-json'               # Quick Look plugin for JSON files
  cask 'webpquicklook'                # Quick Look plugin for webp files

  # app store
  mas 'Amphetamine', id: 937984704
  mas 'Apple Developer', id: 640199958
  mas 'Balatro+', id: 6502451661
  mas 'iMovie', id: 408981434
  mas 'Keynote', id: 409183694
  mas 'Magnet', id: 441258766
  mas 'Numbers', id: 409203825
  mas 'Pages', id: 409201541
  mas 'Perplexity', id: 6714467650
  mas 'stts', id: 1187772509
  mas 'TestFlight', id: 899247664
  mas 'Xcode', id: 497799835
  mas 'Windows App', id: 1295203466
end
