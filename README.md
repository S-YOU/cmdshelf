<p align="center">
  <a href="https://github.com/toshi0383/cmdshelf">
    <img src="https://github.com/toshi0383/assets/blob/master/cmdshelf/banner.png" alt="XcodeGen" />
  </a>
</p>
<p align="center">
  <a href="https://swift.org/package-manager">
    <img src="https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=flat" alt="SPM" />
  </a>
  <a href="https://github.com/yonaskolb/Mint">
    <img src="https://img.shields.io/badge/Mint-compatible-brightgreen.svg?style=flat" alt="Mint" />
  </a>
  <a href="https://github.com/toshi0383/cmdshelf/releases">
    <img src="https://img.shields.io/github/release/toshi0383/cmdshelf.svg" alt="Git Version" />
  </a>
  <a href="https://www.bitrise.io/app/8cd851f423fba13c">
    <img src="https://www.bitrise.io/app/8cd851f423fba13c/status.svg?token=Y4cdlYz2JpdDVxAr1eiOEA" alt="Build Status" />
  </a>
  <a href="https://github.com/toshi0383/cmdshelf/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-lightgray.svg" alt="license" />
  </a>
</p>

cmdshelf is a new way of scripting.😎

- ✅ Seperate name space using directories (e.g. `swiftpm/install.sh` `your/tool/install.sh`)
- ✅ No more `$PATH` configurations
- ✅ `stdout`, `stdin`, `stderr`
- ✅ No quoting required for arguments. (just like `swift run`)
- ✅ The coolest manual page
- ✅ Portable environment (`.cmdshelf.yml`)
- ✅ Execute any remote/local executables.

You can see detailed document [here](docs/getting-started.md), or type `man cmdshelf`.

# Pro tip

## Use auto bash-completion
In case of binary install suggested [here](#installsh), `cmdshelf-completion.bash` is copied under `/usr/local/etc/bash-completion.d`. All you have to do is to make bash be aware of that file.

Either put this in your `~/.bashrc`,
```shell
source /usr/local/etc/bash_completion.d/cmdshelf-completion.bash
```

or install `bash-completion` via homebrew. (Personally I've never managed it to work correctly.)

If you build from source either via `Mint` or manually, then you first have to copy or symlink it manually.
```shell
# copy
cp Sources/Scripts/cmdshelf-completion.bash /usr/local/etc/bash-completion.d/

# or simlink
ln -s Sources/Scripts/cmdshelf-completion.bash /usr/local/etc/bash-completion.d/cmdshelf-completion.bash
```

# Install
## macOS
### install.sh
I've written install/release scripts for SwiftPM executable.  
This should be the easiest and stable way.
```
bash <(curl -sL https://raw.githubusercontent.com/toshi0383/scripts/master/swiftpm/install.sh) toshi0383/cmdshelf
```

### Using [Mint](https://github.com/yonaskolb/Mint)
```
mint install toshi0383/cmdshelf
```

### Build from source

- Clone this repo and run `swift build -c release`.
- Executable will be created at `.build/release/cmdshelf`.
- `mv .build/release/cmdshelf /usr/local/bin/`

## Linux
### Build from source

Please build from source for Linux. You need Swift installed.

- Clone this repo and run `swift build -c release`.
- Executable will be created at `.build/release/cmdshelf`.
- `mv .build/release/cmdshelf /usr/local/bin/`

# Contribute
Any contribution is welcomed.
Feel free to open issue for bug reports, questions, or feature requests.

To start developing, clone and run following.
```
make bootstrap
```

# Development
- Xcode9.3.1+
- Swift4.1+
