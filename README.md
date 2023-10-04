# Eval Brew

## How do I install these formulae?

`brew install eval/brew/<formula>`

Or `brew tap eval/brew` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Release

```bash
# check if download url exists and fix SHA
$ brew reinstall deps-try
$ brew audit --tap=eval/brew
$ brew style --fix eval/brew
```

## Links

- [Repository](https://github.com/eval/homebrew-brew)

### Formulae

- [deps-try](https://github.com/eval/homebrew-brew/blob/main/Formula/deps-try.rb)
- [venster](https://github.com/eval/homebrew-brew/blob/main/Formula/venster.rb)
