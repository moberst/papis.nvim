# Changelog

## [0.6.0](https://github.com/jghauser/papis.nvim/compare/v0.5.1...v0.6.0) (2024-07-03)


### ⚠ BREAKING CHANGES

* **at-cursor:** add icon to at-cursor popup

### Features

* **at-cursor:** add icon to at-cursor popup ([4eeb7bc](https://github.com/jghauser/papis.nvim/commit/4eeb7bc4cbc603dd4cf6826297186fccbf763d37))
* check for schema changes on startup ([850988c](https://github.com/jghauser/papis.nvim/commit/850988cba3726147a27d2bc3820b6b0ddb1b9cce))


### Bug Fixes

* **health:** checkhealth should be normal startup condition ([684d6d2](https://github.com/jghauser/papis.nvim/commit/684d6d228bb5107ddb820070eef0f2c2296d9973))
* **health:** force start papis ([a2b3bf3](https://github.com/jghauser/papis.nvim/commit/a2b3bf32827da69a2932add285b174ee03822abf))
* **init:** only ever run loadPapis autocmd once ([4a09b98](https://github.com/jghauser/papis.nvim/commit/4a09b98bd705709917164cbcadada85f901b6768))
* **keymaps:** create buffer local keymaps for all matching buffers ([c30be92](https://github.com/jghauser/papis.nvim/commit/c30be924fb5a17188eec89d4f766349caf514495))
* make icon style more consistent ([745983b](https://github.com/jghauser/papis.nvim/commit/745983b8cd816f41f847a5bfaae826c3bff9af2c))
* only start papis.nvim once ([a5ffbd0](https://github.com/jghauser/papis.nvim/commit/a5ffbd0b9169bc597322fa55fc3b22bb74c73b7e))
* **search:** don't deepcopy, use metatable ([9322c41](https://github.com/jghauser/papis.nvim/commit/9322c41d1901fbd295bc0afa2588abee73b81528))
* **utils:** check if handle exists before closing ([db3632a](https://github.com/jghauser/papis.nvim/commit/db3632a038db9ad2ac4121c31f50d48a742b1dea))

## [0.5.1](https://github.com/jghauser/papis.nvim/compare/v0.5.0...v0.5.1) (2024-06-19)


### Bug Fixes

* **search:** copy entry_display from telescope before amending it ([c7b0f47](https://github.com/jghauser/papis.nvim/commit/c7b0f47445c86dbddfd8b81678be097bee99fbf1))

## [0.5.0](https://github.com/jghauser/papis.nvim/compare/v0.4.0...v0.5.0) (2024-06-18)


### ⚠ BREAKING CHANGES

* rework commands and keymaps
* add pretty icons

### Features

* add pretty icons ([f14ce7d](https://github.com/jghauser/papis.nvim/commit/f14ce7dcca7d05c25c837cb5d93a51bc6c1caacb))
* rework commands and keymaps ([93f56ca](https://github.com/jghauser/papis.nvim/commit/93f56caf854e093aac3d74eed4c51b88f75a432b))
* **search:** make telescope speedier ([c71dbe5](https://github.com/jghauser/papis.nvim/commit/c71dbe54e66595e9c88564ce709ab856ceba6cf6))
* use option from Papis to open external files ([4a0575f](https://github.com/jghauser/papis.nvim/commit/4a0575f3ea4697d4284839ec3a7682ad74164003))


### Bug Fixes

* add missing modules (oops) ([5e0c9c7](https://github.com/jghauser/papis.nvim/commit/5e0c9c7aec4f4f696661a715f898a46a0507a957))
* **data:** update precalc after updating db ([728e017](https://github.com/jghauser/papis.nvim/commit/728e0177759e4f21bdb782bc5342ff1d08d6ba62))
* **papis-storage:** remove all control chars from strings ([3cd93d0](https://github.com/jghauser/papis.nvim/commit/3cd93d02817bcc6b31c9c54d381cd55fe7cf5c74))
* **papis-storage:** remove newline/carrage return chars when importing ([31304b0](https://github.com/jghauser/papis.nvim/commit/31304b0e123cb059bfc803f5b3bc5b9f53142f8b))

## [0.4.0](https://github.com/jghauser/papis.nvim/compare/v0.3.3...v0.4.0) (2024-06-13)


### Features

* improve lazy-loading ([b685f69](https://github.com/jghauser/papis.nvim/commit/b685f696b25bd5c6d13a12d67f8a5ee53d9075e1))
* initially sort telescope entries by time-added ([eae91b8](https://github.com/jghauser/papis.nvim/commit/eae91b8864de336cc0bab044a227fcba6c12acf6))


### Miscellaneous Chores

* release 0.4.0 ([0fae1bf](https://github.com/jghauser/papis.nvim/commit/0fae1bf215193fb202eb3f107ed8aeef98033959))

## [0.3.3](https://github.com/jghauser/papis.nvim/compare/v0.3.2...v0.3.3) (2024-06-09)


### Bug Fixes

* **colors:** change hl group for normal text ([b3c8456](https://github.com/jghauser/papis.nvim/commit/b3c8456f796b1042f980d0a25f8a67978f908312))
* **config:** create logger early when no Papis config ([33d0dc2](https://github.com/jghauser/papis.nvim/commit/33d0dc21e713298cff88702414b29de335cdf253))
* **sqlite-wrapper:** create db folder recursively ([e5207e9](https://github.com/jghauser/papis.nvim/commit/e5207e9f17acf00b3582a603693b1b0218771d02)), closes [#67](https://github.com/jghauser/papis.nvim/issues/67)

## [0.3.2](https://github.com/jghauser/papis.nvim/compare/v0.3.1...v0.3.2) (2024-06-05)


### Bug Fixes

* add pathlib to luarocks dependencies ([4e8b1df](https://github.com/jghauser/papis.nvim/commit/4e8b1dfd3ad803257634f6a54062b4cb82d6963c))

## [0.3.1](https://github.com/jghauser/papis.nvim/compare/v0.3.0...v0.3.1) (2024-06-05)


### Features

* **config:** add info msg when Papis config import without changes ([0001954](https://github.com/jghauser/papis.nvim/commit/00019541930c2fa376daa8f11674fd29646b2b3b))
* default format_function_fn for markdown, not norg ([542eff0](https://github.com/jghauser/papis.nvim/commit/542eff04e021f400157422738138276f739e131e))
* use short titles when formatting notes ([6234a84](https://github.com/jghauser/papis.nvim/commit/6234a8489788d7f9a295c768e677a096380a15cb))


### Bug Fixes

* **config:** use correct config file if testing is enabled ([99aae36](https://github.com/jghauser/papis.nvim/commit/99aae368f277a57aa6a6b9ba28b29b3c0d18f0e6))
* **log:** add missing module ([a1aff00](https://github.com/jghauser/papis.nvim/commit/a1aff006e21fbd02b2e7e139354310383fdf5cd9))
* remove remaining plenary.path function calls ([2e8b846](https://github.com/jghauser/papis.nvim/commit/2e8b846e4ba180d1bc1c9893f931393c8f0ada32))


### Miscellaneous Chores

* release 0.3.1 ([68f8e79](https://github.com/jghauser/papis.nvim/commit/68f8e79c5b3fb3a294570e5e0c1c5f1ff1e18ee9))

## [0.3.0](https://github.com/jghauser/papis.nvim/compare/v0.2.0...v0.3.0) (2024-06-04)


### ⚠ BREAKING CHANGES

* replace plenary.path with pathlib

### Bug Fixes

* **colors:** use a default hl without bg ([e3f0ec3](https://github.com/jghauser/papis.nvim/commit/e3f0ec344b46760fac4e3a3d6e3141106749f76b))
* remove nvim-treesitter dependency ([cbed835](https://github.com/jghauser/papis.nvim/commit/cbed835b771d71a7b70383f3f17515cc8b3a82d1))


### Miscellaneous Chores

* release 0.3.0 ([917e9ae](https://github.com/jghauser/papis.nvim/commit/917e9aee8dd5d990020501ef41caacbaa186d0b8))


### Code Refactoring

* replace plenary.path with pathlib ([50c7057](https://github.com/jghauser/papis.nvim/commit/50c7057ad6365342621ef77cedfbd2135f173896))

## [0.2.0](https://github.com/jghauser/papis.nvim/compare/v0.1.0...v0.2.0) (2024-06-03)


### ⚠ BREAKING CHANGES

* add better handling of Papis config
* **commands:** remove `PapisStart` command
* handle only autostart on filetypes, not filenames

### remove

* **commands:** remove `PapisStart` command ([9d37fd9](https://github.com/jghauser/papis.nvim/commit/9d37fd9001bd56012ee1b7f671b151db0208678f))
* handle only autostart on filetypes, not filenames ([2a0f826](https://github.com/jghauser/papis.nvim/commit/2a0f82658e1144f1025fca74e50e94266d93dd62))


### Features

* add better handling of Papis config ([029548e](https://github.com/jghauser/papis.nvim/commit/029548e3a90da2990aa4e7ab66b902e877795925))
* **commands:** make all commands buffer local ([20026a4](https://github.com/jghauser/papis.nvim/commit/20026a4278ad9f784e5b0754b1ecf6a732af09ee))
* **config:** add testing module ([077c46e](https://github.com/jghauser/papis.nvim/commit/077c46ea1c73c059c6de572f36007a4d1050cb98))
* **keymaps:** make all keymaps buffer local ([0b82cb5](https://github.com/jghauser/papis.nvim/commit/0b82cb57441bef6331b3f44a672864de71348151))


### Bug Fixes

* **colors:** this time really get the colors right ([1be3c9f](https://github.com/jghauser/papis.nvim/commit/1be3c9fa2f9719caf448a59aac2cf7784568057e))
* **config:** drop config before re-importing ([3814a6d](https://github.com/jghauser/papis.nvim/commit/3814a6dbd3cc1d8b08e8248a90c5eb94d2b2eda3))
* **config:** fix running without testing module ([76bdb14](https://github.com/jghauser/papis.nvim/commit/76bdb14212c3b3b20b034b4775fe777569493ad5))
* **config:** handle when papis options are rm'd from papis.nvim ([bf34de4](https://github.com/jghauser/papis.nvim/commit/bf34de442495554efa573166c7f6686b3bf30c1e))
* **health:** replace deprecated functions ([b24bfc2](https://github.com/jghauser/papis.nvim/commit/b24bfc242e538f9f16b02a5f5e004d33d5326f18))
* **highlights:** fit with neovim default theme ([280a994](https://github.com/jghauser/papis.nvim/commit/280a9944960a4dc2ad1818c46822bcd0d03c852c))
* **telescope:** remove vim.print ([a562767](https://github.com/jghauser/papis.nvim/commit/a5627672bc981a99633cf6c3989538f7793e2842))


### Miscellaneous Chores

* release 0.2.0 ([22944f8](https://github.com/jghauser/papis.nvim/commit/22944f8713db2e99071b1c209fdabc6077b19a0d))
